#!/usr/bin/perl 

use strict;
use warnings;
use FindBin;
use Data::Dumper;
use lib "$FindBin::Bin/lib";
use JPClient;

my $x = JPClient->new( apikey => '7' x 56, );

#print Dumper $x->account()->login( { params => {} } );

print "#-------------------------------\n";
print Dumper $x->account->login(
    {
        email         => 'valid@site.com',
        password      => 'hello',
        type          => 'recruiter',
        persist_login => 1,
    }
);
print "#--------------------------------\n";
print Dumper $x->account->logout();
