package JPClient::Candidate::Vacancy;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'applied';
dynamic_call 'apply';
dynamic_call 'find';
dynamic_call 'get';
dynamic_call 'get_ratings';
dynamic_call 'rate';

freeze;

1;

