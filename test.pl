# Version 0.9

print "1..5\n";

use Geography::Countries::LatLong;
print "ok 1\n";
if ($Geography::Countries::LatLong::VERSION==0.9){
	print "ok 2\n";
} else {
	print "not ok 2\n";
}

if (ref latlong("Niue") eq 'ARRAY'){
	print "ok 3\n";
} else {
	print "not ok 3\n";
}
@_ = latlong_aspair('Niue');
if ($_[0] eq '-19.0516' and $_[1] eq '-169.8631'){
	print "ok 4\n";
} else {
	print "not ok 4\n";
}
if (not latlong_aspair('Bum')){
	print "ok 5\n";
} else {
	print "not ok 5\n";
}

