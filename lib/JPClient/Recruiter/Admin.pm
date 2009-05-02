package JPClient::Recruiter::Admin;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'promote';
dynamic_call 'demote';

freeze;

1;

