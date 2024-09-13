#!/usr/bin/env perl

use strict;
use warnings;

my $n = 0;

my $arg = shift;

while ($n < 100) {
	
	print " " if ($arg =~ /^$/);
	$n++;
}
