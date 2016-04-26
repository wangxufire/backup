#!/usr/bin/perl

use strict;
my $pw=$ARGV[0];
print crypt($pw,$pw)."\n";
