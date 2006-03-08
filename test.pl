use Test::More tests => 6;

BEGIN {
	use_ok( "Geography::Countries::LatLong" => 0.91 )
}

isa_ok( latlong("Niue"),'ARRAY', 'return');
@_ = latlong_aspair('Niue');

is($_[0], '-19.0516', 'lat');
is($_[1], '-169.8631', 'lon');

is(latlong_aspair('Hyperion'), undef, 'bad country');

isnt(Geography::Countries::LatLong::supports('Hungary'),undef,'supports');

exit;
