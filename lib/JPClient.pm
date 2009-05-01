package JPClient;

# $Id:$

use JPClient::API;
use RPC::XML::Client;

use namespace::clean -except => [qw( has meta dynamic_call freeze child_namespace )];

has hostname => (
    isa     => 'Str',
    is      => 'rw',
    default => 'localhost',
);

has port => (
    isa     => 'Int',
    is      => 'rw',
    default => 3000,
);

has apikey => (
    isa      => 'Str',
    required => 1,
    is       => 'rw',
);

has path => ( 
    isa => 'Str',
    is  => 'rw',
    default => 'api/xmlrpc/',
);

has persistent => (
    isa      => 'Bool',
    required => 0,
    default  => 1,
);

has _prefix => (
    isa => 'Str', 
    is => 'rw',
    required => 0, 
    default => '', 
);

has _connector => (
    isa => 'RPC::XML::Client', 
    is  => 'rw', 
    lazy_build => 1, 
);


child_namespace 'account';
child_namespace 'info';
child_namespace 'recruiter';
child_namespace 'candidate';

sub _build__connector {
    my $self = shift;
    return RPC::XML::Client->new( 
        sprintf('http://%s:%s/%s', $self->hostname, $self->port, $self->path )
    );
}

freeze();
1;

