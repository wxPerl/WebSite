#!perl

use strict;
use warnings;
use Fatal qw(open);
use File::Basename;

binmode STDOUT;

my( $src, $xml, $type ) = @ARGV;

my $src_name = basename $src; $src_name =~ s/\.p[lm]$//;

open my $src_fh, "< $src";

if( $type eq "pl" ) {
    while( <$src_fh> ) {
        next if /^#\<!--/;
        print;
    }
} else {
    open my $xml_fh, "< $xml";

    while( <$xml_fh> ) {
        print;
        next unless m/^\<!--\s+replace\s+$src_name\s+\#(\d+)/o;
        my $prog = <$xml_fh>;
        print $prog;

        my $num = $1;

        OUT: while( <$src_fh> ) {
            next unless /^#\<!--\s+replace\s+#$num/;
            while( <$src_fh> ) {
                last OUT if /^#\<!--/;
                s/\&/\&amp;/g;
                s/\</\&lt;/g;
#                s/\>/\&gt;/g;
                print "$_";
            }
        }

        while( <$xml_fh> ) {
            last if /^\<!--/;
        }

        $prog =~ s/\</\<\//;
        print $prog;
        print;
    }
}
