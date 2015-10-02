# Pragmas.
use strict;
use warnings;

# Modules.
use English;
use Map::Tube::Bucharest;
use Test::More tests => 5;
use Test::NoWarnings;

# Test.
my $map = Map::Tube::Bucharest->new;
eval {
	$map->get_shortest_route;
};
like($EVAL_ERROR, qr/ERROR: Either FROM\/TO node is undefined/,
	'Either FROM/TO node is undefined');

# Test.
eval {
	$map->get_shortest_route('Foo');
};
like($EVAL_ERROR, qr/ERROR: Either FROM\/TO node is undefined/,
	'Either FROM/TO node is undefined');

# Test.
eval {
	$map->get_shortest_route('Foo', 'Bar');
};
like(
	$EVAL_ERROR,
	qr/\QMap::Tube::get_shortest_route(): ERROR: Received invalid FROM node 'Foo'\E/,
	"Received invalid FROM node 'Foo'.",
);

# Test.
eval {
	$map->get_shortest_route('Obor', 'Foo');
};
like(
	$EVAL_ERROR,
	qr/\QMap::Tube::get_shortest_route(): ERROR: Received invalid TO node 'Foo'\E/,
	"Received invalid TO node 'Foo'.",
);
