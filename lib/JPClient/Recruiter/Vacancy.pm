package JPClient::Recruiter::Vacancy;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'get';
dynamic_call 'post';
dynamic_call 'publish';

freeze;

1;

