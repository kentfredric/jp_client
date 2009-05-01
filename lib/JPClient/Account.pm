package JPClient::Account;

# $Id:$

use JPClient::API;

use namespace::clean -except => [qw( has meta dynamic_call freeze has_parent)];

has_parent;
dynamic_call 'login';
dynamic_call 'logout';

freeze;

1;

