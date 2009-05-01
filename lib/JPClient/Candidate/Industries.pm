package JPClient::Candidate::Industries;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'get';
dynamic_call 'set';

freeze;

1;

