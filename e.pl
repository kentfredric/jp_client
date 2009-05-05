#!/usr/bin/perl 

use strict;
use warnings;
use FindBin;
use Data::Dumper;
use lib "$FindBin::Bin/lib";
use JPClient;

my $x = JPClient->new(
    defaultparams => [qw( apikey auth )],
    beforesend    => sub {
        my ( $self, $sys, $params ) = @_;
        $params->{apikey} = '7' x 56;
        $params->{auth}   = {
            email    => 'valid@site.com',
            password => 'hello',
            type     => 'recruiter',
        };
        return $params;
    }
);

#print Dumper $x->account()->login( { params => {} } );

print Dumper $x->info->list_industries();
print "#-------------------------------\n";
print Dumper $x->candidate->register();

#$x->candidate->agency;

