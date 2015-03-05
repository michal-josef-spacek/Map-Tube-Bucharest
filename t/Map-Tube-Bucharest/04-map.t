# Pragmas.
use strict;
use warnings;

# Modules.
use Map::Tube::Bucharest;
use Test::More;
use Test::Map::Tube;
# TODO Opravit.
#use Test::NoWarnings;

# Test.
ok_map(Map::Tube::Bucharest->new);
