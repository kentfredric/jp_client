package JPClient::Account;

# $Id:$

use JPClient::API;

has_parent;
dynamic_call login  => ();
dynamic_call logout => ();

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
