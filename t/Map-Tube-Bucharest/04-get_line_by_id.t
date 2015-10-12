# Pragmas.
use strict;
use warnings;

# Modules.
use English;
use Map::Tube::Bucharest;
use Test::More tests => 4;
use Test::NoWarnings;

# Test.
my $map = Map::Tube::Bucharest->new;
my $ret = $map->get_line_by_id('foo');
is($ret, undef, 'Get line for bad line id.');

# Test.
$ret = $map->get_line_by_id;
is($ret, undef, 'Missing line id.');

# Test.
$ret = $map->get_line_by_id('M1');
is($ret->name, 'Linia M1', 'Get line for line id.');
