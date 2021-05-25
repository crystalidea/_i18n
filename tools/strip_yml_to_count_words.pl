open F, $ARGV[0] or die "Cannot open";

while (<F>) {
    if ($_ =~ /\s+.+:\s(.+)/) {
        print "$1\n";
    }
}