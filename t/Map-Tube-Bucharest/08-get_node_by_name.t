# Pragmas.
use strict;
use warnings;

# Modules.
use Map::Tube::Bucharest;
use Test::More tests => 3;
use Test::NoWarnings;

# Test.
my $map = Map::Tube::Bucharest->new;
my $ret = $map->get_node_by_name('foo');
is($ret, undef, 'Get node for bad node name.');

# Test.
my @ret = sort map { $_->id } $map->get_node_by_name('Eroilor');
is_deeply(
	\@ret,
	[
		'EROILOR',
	],
	"Get all nodes for 'Eroilor'.",
);
