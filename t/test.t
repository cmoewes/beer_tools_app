use Test::More;

use_ok('Beer::Tools::Partigyle');
use_ok('Beer::Tools');

use Data::Dumper;

my $split = Beer::Tools::Partigyle->return_split( plato => 16, gallons => 14 );

warn Beer::Tools->_plato_to_sg( $split->[0]->{plato} );
warn Beer::Tools->_plato_to_sg2( $split->[0]->{plato} );

warn Beer::Tools->_plato_to_sg( $split->[1]->{plato} );
warn Beer::Tools->_plato_to_sg2( $split->[1]->{plato} );

#warn Beer::Tools::Partigyle->_sg_to_plato(1.010);
#warn Beer::Tools::Partigyle->_sg_to_plato(1.012);
#warn Beer::Tools::Partigyle->_sg_to_plato(1.014);
#warn Beer::Tools::Partigyle->_sg_to_plato(1.016);
#warn Beer::Tools::Partigyle->_sg_to_plato(1.018);

#warn Beer::Tools::Partigyle->_plato_to_sg(Beer::Tools::Partigyle->_sg_to_plato(1.010));
#warn Beer::Tools::Partigyle->_plato_to_sg(Beer::Tools::Partigyle->_sg_to_plato(1.020));
#warn Beer::Tools::Partigyle->_plato_to_sg(Beer::Tools::Partigyle->_sg_to_plato(1.030));
#warn Beer::Tools::Partigyle->_plato_to_sg(Beer::Tools::Partigyle->_sg_to_plato(1.040));
#warn Beer::Tools::Partigyle->_plato_to_sg(Beer::Tools::Partigyle->_sg_to_plato(1.050));
