package JPClient::Recruiter;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'register';
dynamic_call 'change_password';

child_namespace 'admin';
child_namespace 'agency';
child_namespace 'application';
child_namespace 'candidate';
child_namespace 'cv';
child_namespace 'funds';
child_namespace 'profile';
child_namespace 'question';
child_namespace 'search';
child_namespace 'vacancy';

freeze;

1;

