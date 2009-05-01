package JPClient::Account;

# $Id:$

use JPClient::API;

has_parent;
dynamic_call 'login' => (
    postreceive => sub {
        my ( $self, $sys, $result ) = @_;
        if ( exists $result->{session} and exists $result->{session}->{id} ) {
            $sys->session_key( $result->{session}->{id}->value() );
        }
        return $result;
    }
);
dynamic_call 'logout';

freeze;

1;

