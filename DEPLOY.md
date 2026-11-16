# Hosting the site on Cloudflare Pages

The goal: serve the site from `<project-name>.pages.dev` instead of GitHub Pages, keep the
GitHub repository private, and leave no trace of the GitHub account in the site's address or
page source.

The site is static and the generated pages are committed, so Cloudflare has nothing to build:
it just serves the files from the repository root.

---

## Step 0: Pick the project name

The Cloudflare project name becomes the address: `<project-name>.pages.dev`.

- Lowercase letters, numbers and dashes only (for example `mudarasat`).
- If the name is taken, Cloudflare adds a random suffix (such as `mudarasat-4xk.pages.dev`).
  Check the final address in step 4 before you do step 1, or redo step 1 afterwards.

---

## Step 1: Point the site at the new address

Every page carries its full address in its share-preview tags (`og:url`, `og:image`). These
come from `baseUrl` in `src/site.json`.

1. Open `src/site.json` and change `baseUrl` to the new address, keeping the trailing slash:

   ```json
   "baseUrl": "https://<project-name>.pages.dev/",
   ```

2. Rebuild the generated pages:

   ```powershell
   ./build.ps1
   ```

3. Confirm the old address is gone from every page. This should print nothing:

   ```powershell
   Get-ChildItem -Recurse -Include *.html, *.json, *.webmanifest, *.js |
     Where-Object { $_.FullName -notmatch '\\(\.git|node_modules)\\' } |
     Select-String -Pattern 'github\.io'
   ```

4. Run the checks, then commit and push:

   ```powershell
   ./tools/check-site.ps1
   git add -A
   git commit -m "Move the site address to Cloudflare Pages"
   git push
   ```

---

## Step 2: Create a Cloudflare account

1. Sign up at <https://dash.cloudflare.com/sign-up>. The free plan is enough.
2. Verify your email address.

---

## Step 3: Connect the GitHub repository

1. In the Cloudflare dashboard, open **Workers & Pages** (left sidebar, under **Compute**).
2. Click **Create** → the **Pages** tab → **Connect to Git** (sometimes labelled
   **Import an existing Git repository**).
3. Choose **GitHub** and click **Connect GitHub**. GitHub opens and asks you to install the
   **Cloudflare Workers and Pages** app.
4. On the GitHub install screen, choose **Only select repositories** and pick only
   `binaamanhaji-bashaer`. Click **Install & Authorize**.
5. Back in Cloudflare, select the repository and click **Begin setup**.

> The app keeps working after the repository is made private (step 5), because you gave it
> access explicitly.

---

## Step 4: Build settings

| Setting | Value |
|---|---|
| Project name | your chosen name from step 0 |
| Production branch | `main` |
| Framework preset | **None** |
| Build command | `find . -type d -name refs -prune -exec rm -rf {} +` *(required: deletes the source PDFs and transcripts in `refs/` from the deployed copy so the site never serves them)* |
| Build output directory | `/` *(or leave empty; both mean the repository root)* |
| Root directory (advanced) | leave empty |
| Environment variables | none |

Click **Save and Deploy**. The first deployment takes about a minute. When it finishes,
Cloudflare shows the address, `https://<project-name>.pages.dev`.

Open it and check:

- the home page, a specialty, a course and a lecture page all load;
- search works;
- the Arabic folder and file names open correctly;
- offline mode works: open a few pages, turn the network off in DevTools
  (**Network → Offline**), and reload.

---

## Step 5: Make the GitHub repository private

1. On GitHub, open the repository → **Settings** → **General**.
2. Scroll to **Danger Zone** → **Change repository visibility** → **Make private**, and
   confirm.

Your code, commit history and commit author details are no longer visible to the public.

---

## Step 6: Turn off GitHub Pages

1. In the repository, open **Settings** → **Pages**.
2. If the site is still listed, click **Unpublish site**, or set **Source** to **None**.
   (On a free account, making the repository private usually turns Pages off by itself.)
3. Open the old `…github.io/binaamanhaji-bashaer/` address in a private browser window. It
   should show a 404 page. GitHub's cache can take a few minutes to clear.

---

## Step 7: Final privacy check

On the new site, open any page, press **Ctrl+U** (view source) and search for `github`. The
only hits should be the font licence links in `assets/fonts/`, which point to the font
project, not to you.

Things you cannot control:

- links people already saved or shared with the old address;
- copies in search engines and the Wayback Machine (they fade or update over time; you can
  ask Google to recrawl through Google Search Console if needed).

---

## Day-to-day updates

Nothing changes in your workflow:

1. Edit in `src/`, run `./build.ps1`, run `./tools/check-site.ps1`.
2. Commit and push to `main`.
3. Cloudflare deploys automatically within a minute or two.

Extras you get for free:

- **Preview links:** pushing any other branch creates a preview at
  `<branch>.<project-name>.pages.dev`, so you can check changes before merging to `main`.
- **Rollback:** in **Workers & Pages → your project → Deployments**, any earlier deployment
  can be restored with **Rollback to this deployment**.
- **Checks still run:** the GitHub Actions check (`.github/workflows/checks.yml`) keeps running
  on the private repository. The free plan includes 2,000 minutes a month, far more than this
  needs.

---

## Optional: make site updates reach visitors faster

By default the browser may cache `sw.js` for a while, which delays updates. Cloudflare reads a
file named `_headers` in the output directory. Create `_headers` in the repository root:

```
/sw.js
  Cache-Control: no-cache

/manifest.webmanifest
  Cache-Control: no-cache
```

Commit and push. To verify, open DevTools → **Network**, reload, click `sw.js`, and check
that the response headers include `cache-control: no-cache`.

---

## Optional: a custom domain later

1. Buy a domain (any registrar, or Cloudflare Registrar at cost price).
2. In **Workers & Pages → your project → Custom domains → Set up a custom domain**, enter it
   and follow the DNS instructions. HTTPS is set up automatically.
3. Change `baseUrl` in `src/site.json` to the new domain, rebuild, commit and push (as in
   step 1).

---

## Troubleshooting

| Problem | Fix |
|---|---|
| A `refs/` PDF still opens on the site | The build command from step 4 is missing. Add it and redeploy. |
| Pages show the repository's file listing or a 404 at `/` | Build output directory must be `/` or empty, not `src`. |
| Cloudflare can't see the repository | GitHub → **Settings → Applications → Cloudflare Workers and Pages → Configure**, and add the repository. |
| Old content after a push | Check **Deployments** to see whether the latest commit deployed. Then hard-reload (Ctrl+Shift+R); the service worker may need one extra reload. |
| A page still shows `github.io` in its source | `baseUrl` wasn't updated or the site wasn't rebuilt. Repeat step 1. |

---

## Note: everything in the repository is public on the site

Cloudflare serves every file in the repository root except the `refs/` folders, which the build
command deletes. That includes `src/`, `tools/`, `.claude/` and this file. None of them reveal
the GitHub account once `baseUrl` is updated. GitHub Pages behaves the same way today, and
`_config.yml` keeps it from serving `refs/`. To publish only the site files, the build
step would need to copy them into a separate folder (for example `dist/`) and use that folder
as the output directory.
