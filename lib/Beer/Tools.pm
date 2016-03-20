package Beer::Tools;

use Moose;

sub _sg_to_plato {
	my $self = shift;
	my $sg   = shift;

	return sprintf( '%.2f', ( ( ( 182.4601 * $sg - 775.6821 ) * $sg + 1262.7794 ) * $sg - 669.5622 ) );
}

sub _plato_to_sg {
	my $self  = shift;
	my $plato = shift;

	return sprintf( '%.3f', ( 1 + ( $plato / ( 258.6 - ( ( $plato / 258.2 ) * 227.1 ) ) ) ) );

}

sub _plato_to_sg2 {
	my $self  = shift;
	my $plato = shift;

	return sprintf( '%.3f', 259 / ( 259 - $plato ) );

}

1; # End of Beer::Tools
