# Pragmas.
use strict;
use warnings;

# Modules.
use Encode qw(decode_utf8);
use English;
use Map::Tube::Bucharest;
use Test::More tests => 4;
use Test::NoWarnings;

# Test.
my $map = Map::Tube::Bucharest->new;
eval {
	$map->get_stations;
};
like($EVAL_ERROR, qr{^Map::Tube::get_stations\(\): ERROR: Missing Line Name. \(status: 104\)},
	'Missing line name.');

# Test.
eval {
	$map->get_stations('foo');
};
like($EVAL_ERROR, qr{^Map::Tube::get_stations\(\): ERROR: Invalid Line Name \[foo\]. \(status: 105\)},
	'Invalid line name.');

# Test.
# TODO Problem je v tom, ze tyhle stanice nejsou poporadku.
my $ret_ar = $map->get_stations('Linia M1');
is_deeply(
	$ret_ar,
	[
		decode_utf8('Piața Victoriei (Linia M1, Linia M2)'),
		'Basarab (Linia M1, Linia M4)',
		'Eroilor (Linia M1, Linia M3)',
		decode_utf8('Piața Unirii 1 (Linia M1, Linia M3)'),
		'Nicolae Grigorescu (Linia M1, Linia M3)',
		'Izvor (Linia M1, Linia M3)',
		'Timpuri Noi (Linia M1, Linia M3)',
		'Mihai Bravu (Linia M1, Linia M3)',
		'Dristor 1 (Linia M1, Linia M3)',
		'Dristor 2 (Linia M1)',
		decode_utf8('Piața Muncii (Linia M1)'),
		'Iancului (Linia M1)',
		'Obor (Linia M1)',
		decode_utf8('Ștefan cel Mare (Linia M1)'),
		'Gara de Nord (Linia M1)',
		decode_utf8('Crângași (Linia M1)'),
		'Petrache Poenaru (Linia M1)',
		decode_utf8('Grozăvești (Linia M1)'),
		'Titan (Linia M1)',
		'Costin Georgian (Linia M1)',
		'Republica (Linia M1)',
		'Pantelimon (Linia M1)',
	],
	"Get stations for line 'Linia M1'.",
);
