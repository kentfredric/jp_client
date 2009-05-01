package JPClient::API;

# $Id:$

use Moose           ();
use Carp            ();
use Data::Dumper    ();
use Moose::Exporter ();

use namespace::clean;

Moose::Exporter->setup_import_methods(
    with_caller => [ 'dynamic_call', 'freeze', 'child_namespace', 'has_parent' ],
    also        => 'Moose',
);

sub expand_params {
    my $package = shift; 
    my $params = shift;
    if ( $package->_sys->has_session_key ){ 
        $params->{session} = $package->_sys->session_key;
    }
    $params->{apikey} = $package->_sys->apikey;
    return $params;
}

sub dynamic_call {
    my ( $caller, $name, %options ) = @_;
    my $beforesend = $options{beforesend};
    my $postreceive = $options{postreceive};

    Class::MOP::Class->initialize($caller)->add_method(
        $name,
        sub {
            my $self = shift; 
            my $params = shift;
            $params = expand_params( $self, $params );
            if( $beforesend ){ 
                $params = $beforesend->( $self, $self->_sys, $params );
            }
            my $result = $self->_connector->send_request( $self->_prefix . '.' . $name , $params );
            if( $postreceive ){ 
                $result = $postreceive->( $self, $self->_sys, $result ); 
            }
            return $result;
#            Carp::carp( "Called $name " . Data::Dumper::Dumper( \@_ ) );
        }
    );
}

sub freeze {
    my ( $caller, $name, %options ) = @_;
    $caller->meta->make_immutable;
}

sub child_namespace {
    my ( $caller, $name, %options ) = @_;
    my $delegatePackage = "${caller}::" . ucfirst $name;
    my $build           = '_build_child_namespace_' . $name;
    my $package         = Class::MOP::Class->initialize($caller);
    $package->add_attribute(
        $name,
        is      => 'rw',
        isa     => 'Object',
        lazy    => 1,
        builder => $build,
    );
    $package->add_method(
        $build,
        sub {
            my $self = shift;
            eval "use $delegatePackage; 1; " or Carp::confess("Can't import $delegatePackage! $! $@ $^E");
            $delegatePackage->new( 
                _parent => $self ,
                _prefix => $self->_prefix . '.'. $name, 
                _connector => $self->_connector , 
                _sys => $self->_sys
            );
        }
    );
}

sub has_parent {
    my ( $caller , $name, %options ) = @_; 
    Class::MOP::Class->initialize($caller)->add_attribute( 
            '_parent', 
            is => 'rw', 
            isa => 'Object', 
            required => '1', 
            weak_ref => '1', 
    );
    Class::MOP::Class->initialize($caller)->add_attribute( 
            '_connector', 
            is => 'rw', 
            isa => 'Object', 
            required => '1', 
            weak_ref => '1', 
    );
    Class::MOP::Class->initialize($caller)->add_attribute( 
            '_prefix', 
            is => 'rw', 
            isa => 'Str', 
            required => '1', 
    );
    Class::MOP::Class->initialize($caller)->add_attribute( 
            '_sys', 
            is => 'rw', 
            isa => 'Object', 
            required => '1', 
            weak_ref => 1,
    );

}

1;

