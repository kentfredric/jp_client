package JPClient::Recruiter::Search::Location;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'get';
dynamic_call 'save';

freeze;

1;

