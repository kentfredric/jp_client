package JPClient::Account;

# $Id:$

use JPClient::API;

has_parent;
dynamic_call login => (
    params      => [qw( email password type persist_login )],
    postreceive => sub {
        my ( $self, $sys, $result ) = @_;

        if ( exists $result->{session} && exists $result->{session}->{id} ) {
            $sys->session_key( $result->{session}->{id}->value() );
        }
        return $result;
    }
);
dynamic_call logout =>;

freeze;

1;


__END__

=head1 Name

JPClient::Account

=head1 Synopsis

See L<JPClient>

=head1 Methods

=over 4

=item ->login

=item ->logout

=back