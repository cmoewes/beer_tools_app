package Beer::Tools::Partigyle;

use Moose;
use Params::Validate;

sub return_split {
	my $self = shift;
	my $p = validate( @_, { plato => 1, gallons => 1 } );

	my $total_points = $p->{plato} * $p->{gallons};
	my $split_volume = $p->{gallons} / 2;

	my $large_gravity = sprintf( '%.1f',( $total_points * .65 ) / $split_volume);
	my $small_gravity = sprintf( '%.1f',( $total_points * .35 ) / $split_volume);

	return [ 
		{ 'split' => 'small', plato => $small_gravity, gallons => $split_volume }, 
		{ 'split' => 'large', plato => $large_gravity, gallons => $split_volume }, ]

}

sub total_points_from_large{
	my $self = shift;
	my $p = validate(@_, {plato => 1, gallons => 1});
	
	use Data::Dumper;
	warn Dumper $p;
	
	my $total_points = ($p->{plato} * $p->{gallons}) / .65;
	
	return sprintf( '%.1f',$total_points / ($p->{gallons} *2));
	
}

sub total_points_from_small{
	my $self = shift;
	my $p = validate(@_, {plato => 1, gallons => 1});
	
	use Data::Dumper;
	warn Dumper $p;
	
	my $total_points = ($p->{plato} * $p->{gallons}) / .35;
	
	return sprintf( '%.1f',$total_points / ($p->{gallons} *2));
	
}

1;
