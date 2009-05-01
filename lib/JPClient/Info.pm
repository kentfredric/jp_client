package JPClient::Info;

# $Id:$

use JPClient::API;

has_parent;

dynamic_call 'list_industries';
dynamic_call 'list_skills';
dynamic_call 'list_languages';
dynamic_call 'list_cities';

freeze;

1;

