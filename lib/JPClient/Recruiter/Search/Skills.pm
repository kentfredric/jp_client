package JPClient::Recruiter::Search::Skills;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'get';
dynamic_call 'save';

freeze;

1;

