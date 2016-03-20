package Beer::Tools::Partigyle;

use Moose;
use Params::Validate;

sub return_split {
	my $self = shift;
	my $p = validate( @_, { plato => 1, gallons => 1 } );

	my $total_points = $p->{plato} * $p->{gallons};
	my $split_volume = $p->{gallons} / 2;

	my $large_gravity = ( $total_points * .65 ) / $split_volume;
	my $small_gravity = ( $total_points * .35 ) / $split_volume;

	return [ { plato => $small_gravity, gallone => $split_volume }, { plato => $large_gravity, gallons => $split_volume }, ]

}

1;
