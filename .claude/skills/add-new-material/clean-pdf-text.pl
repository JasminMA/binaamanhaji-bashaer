# Clean Arabic text extracted with `pdftotext -enc UTF-8` (default mode, not -raw / -layout).
#
#   pdftotext -enc UTF-8 "book.pdf" out.txt
#   perl clean-pdf-text.pl < out.txt > clean.txt
#
# What it fixes:
#   - removes bidi control marks (U+202A-U+202E, U+200E, U+200F) and lines made only of diacritics;
#   - shortens dot leaders in tables of contents ("......" -> "…");
#   - drops empty lines;
#   - rejoins runs of 3+ one-word lines: pdftotext often prints a justified RTL line one word per
#     line in REVERSED order, so the run is reversed and joined. Rejoined lines are wrapped in ⟨ ⟩
#     so they can be spotted and checked against the PDF.
# What it cannot fix: Qur'an text in special fonts (comes out as split letters and stray marks).
# Never copy verses from the extracted text: write them from the mushaf.
use utf8; use strict; use warnings;
binmode STDIN, ':encoding(UTF-8)'; binmode STDOUT, ':encoding(UTF-8)';

my @out; my @run;
sub flush {
    if (@run >= 3) { push @out, '⟨' . join(' ', reverse @run) . '⟩' } else { push @out, @run }
    @run = ();
}
while (my $x = <STDIN>) {
    $x =~ s/[\x{202A}-\x{202E}\x{200E}\x{200F}]//g;
    $x =~ s/\.{5,}/…/g;
    $x =~ s/\s+$//;
    my $t = $x; $t =~ s/^\s+//;
    next if $t eq '';
    next if $t =~ /^[\x{064B}-\x{065F}\x{0670}\x{06D6}-\x{06ED}\x{08D3}-\x{08FF}\s]+$/;   # diacritics only
    if ($t !~ /\s/ && length($t) <= 14 && $t !~ /^\d+$/) { push @run, $t } else { flush(); push @out, $x }
}
flush();
print "$_\n" for @out;
