package JPClient::Recruiter::Question;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'get_sets';
dynamic_call 'add_set';
dynamic_call 'delete_set';
dynamic_call 'get_possible';

freeze;

1;

