#!/usr/bin/perl 

use strict;
use warnings;
use FindBin;
use Data::Dumper;
use lib "$FindBin::Bin/lib";
use JPClient;

my $x = JPClient->new( 
    apikey => '7' x 56,
);

print Dumper $x->account()->login(
 {    params => {}        }
);

