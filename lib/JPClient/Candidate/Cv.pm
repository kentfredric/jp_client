package JPClient::Candidate::Cv;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'delete';
dynamic_call 'get';
dynamic_call 'upload';

freeze;

1;

