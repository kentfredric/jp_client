package JPClient::Candidate;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'register' => ( needparams => [qw( email password name )], );
dynamic_call 'change_password';

child_namespace 'agency';
child_namespace 'basket';
child_namespace 'cities';
child_namespace 'cv';
child_namespace 'industries';
child_namespace 'languages';
child_namespace 'profile';
child_namespace 'recruiter';
child_namespace 'search';
child_namespace 'skills';
child_namespace 'test';
child_namespace 'vacancy';

freeze;

1;

