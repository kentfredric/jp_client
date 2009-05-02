package JPClient::Recruiter::Candidate;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'find';
dynamic_call 'get';
dynamic_call 'email';

freeze;

1;

