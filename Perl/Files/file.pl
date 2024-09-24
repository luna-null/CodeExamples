#!/usr/bin/env perl

use strict;

use warnings;

open my $read_fh, '<', 'text.txt' or die "File error: Can't open $!";

local $/ = undef;

my $file_string = <$read_fh>;

close $read_fh;

if ($file_string =~ /-/) {
    
    $file_string = $file_string =~ s/-/=/g;
    print "'-' matched";
}
else {
    $file_string = $file_string =~ s/=/-/g;
}


open my $write_fh, '>', 'text.txt' or die "File error: Can't open $!";

print $write_fh $file_string;

close $write_fh;

print "Change to file written\n";
