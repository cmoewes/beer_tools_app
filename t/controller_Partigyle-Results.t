use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Beer::Tools';
use Beer::Tools::Controller::Partigyle::Results;

ok( request('/partigyle/results')->is_success, 'Request should succeed' );
done_testing();
