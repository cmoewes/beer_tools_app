use strict;
use warnings;

use Beer::Tools;

my $app = Beer::Tools->apply_default_middlewares(Beer::Tools->psgi_app);
$app;

