package Beer::Tools::Controller::Partigyle::Results;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Beer::Tools::Controller::Partigyle::Results - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 index

=cut

use Beer::Tools::Util;
use Beer::Tools::Partigyle;
use Data::Dumper;

sub index : Path : Args(0) {
	my ( $self, $c ) = @_;

	my $original_plato = Beer::Tools::Util->_sg_to_plato( $c->req->param('starting_gravity') );
	my $results = Beer::Tools::Partigyle->return_split( plato => $original_plato, gallons => $c->req->param('starting_volume') * 2 );

	foreach (@$results) {
		$_->{gravity} = Beer::Tools::Util->_plato_to_sg2( $_->{plato} );
	}

	push @{$results},
	  {
		'split'   => 'full',
		'gallons' => $c->req->param('starting_volume') * 2,
		'gravity' => $c->req->param('starting_gravity'),
		'plato'   => $original_plato
	  };

	$c->stash( results => $results );

}

sub large : Local : Args(0) {
	my ( $self, $c ) = @_;

	my $large_plato = Beer::Tools::Util->_sg_to_plato( $c->req->param('starting_gravity') );

	my $original_plato = Beer::Tools::Partigyle->total_points_from_large( plato => $large_plato, gallons => $c->req->param('starting_volume') );
	my $results = Beer::Tools::Partigyle->return_split(
		plato   => $original_plato,
		gallons => $c->req->param('starting_volume') * 2
	);

	foreach (@$results) {
		$_->{gravity} = Beer::Tools::Util->_plato_to_sg2( $_->{plato} );
	}

	push @{$results},
	  {
		'split'   => 'full',
		'gallons' => $c->req->param('starting_volume') * 2,
		'gravity' => Beer::Tools::Util->_plato_to_sg($original_plato),
		'plato'   => $original_plato
	  };

	$c->stash( results => $results );

}

sub small : Local : Args(0) {

	my ( $self, $c ) = @_;

	my $large_plato = Beer::Tools::Util->_sg_to_plato( $c->req->param('starting_gravity') );

	my $original_plato = Beer::Tools::Partigyle->total_points_from_small( plato => $large_plato, gallons => $c->req->param('starting_volume') );
	my $results = Beer::Tools::Partigyle->return_split(
		plato   => $original_plato,
		gallons => $c->req->param('starting_volume') * 2
	);

	foreach (@$results) {
		$_->{gravity} = Beer::Tools::Util->_plato_to_sg2( $_->{plato} );
	}

	push @{$results}, {
		'split'   => 'full',
		'gallons' => $c->req->param('starting_volume') * 2,
		'gravity' => Beer::Tools::Util->_plato_to_sg($original_plato),
		'plato' => $original_plato
	};

	$c->stash( results => $results );

}

=encoding utf8

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
