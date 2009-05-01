package JPClient::Candidate::Recruiter;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'find';
dynamic_call 'get';

freeze;

1;

