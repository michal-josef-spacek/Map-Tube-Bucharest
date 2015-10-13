# Pragmas.
use strict;
use warnings;

# Modules.
use Map::Tube::Bucharest;
use Test::More tests => 4;
use Test::NoWarnings;

# Test.
my $map = Map::Tube::Bucharest->new;
my $ret = $map->get_line_by_name('foo');
is($ret, undef, 'Get line for bad line name.');

# Test.
$ret = $map->get_line_by_name;
is($ret, undef, 'Missing line name.');

# Test.
$ret = $map->get_line_by_name('Linia M1');
is($ret->id, 'M1', 'Get line for line name.');
