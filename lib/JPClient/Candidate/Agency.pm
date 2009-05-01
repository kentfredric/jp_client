package JPClient::Candidate::Agency;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'find';
dynamic_call 'get';

freeze;

1;

