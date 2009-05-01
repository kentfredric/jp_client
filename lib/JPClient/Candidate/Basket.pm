package JPClient::Candidate::Basket;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'add_vacancy';
dynamic_call 'get';

freeze;

1;

