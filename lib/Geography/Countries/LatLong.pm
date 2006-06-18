package Geography::Countries::LatLong;

=head1 NAME

Geography::Countries::LatLong - mean latitude and longitude

=head1 SYNOPSIS

	use Geography::Countries::LatLong;
	if ( Geography::Countries::LatLong::supports('Hungary') ){
		my $array_ref    = latlong('Hungary');
		my ($lat, $long) = latlongr('Hungary');
	}

=head1 DESCRIPTION

This module provides mean latitude and longitude for a large number
of countries named in English.

Regions and continents are not supported - please see the list below.

Look-up is by the English name of the country, as returned by the C<Geography::Countries>
module, of which this is a sub-class that exports none of its parent's
properties or methods.

The mean values were arrived at with the following I<MATLAB> code,
where C<name> is a country name recognised by I<MATLAB>:

	function [lat,lon] = country_latlon(name);
	  load worldmtx;
	  c=worldhi(name);
	  lat = mean(c.latlim);
	  lon = mean(c.longlim);
	  fprintf( '"%s" => ["%.4f","%.4f"],', name,lat,lon);
	% end function country_latlon

You will need the Mapping Toolbox to run the above snippet.

DEPENDENCIES

This module requires these other modules and libraries:

  Geography::Countries

=head2 EXPORT

This module exports the following subroutines:

	countries
	latlong

=cut

use strict;
use base 'Geography::Countries';
use vars qw/@countries $countries %EXPORT_TAGS @EXPORT_OK/;
use vars qw /@ISA @EXPORT @EXPORT_OK %EXPORT_TAGS $VERSION $countries_latlong/;

@ISA          = qw /Exporter/;
@EXPORT       = qw /country latlong /;
@EXPORT_OK    = qw /countries_latlong/;
$VERSION	  = '0.92';

#
# Arrays of latitude and longitude
# indexed by country names.
#
$countries_latlong = {
	"Afghanistan" => ["33.93045","67.67894"],
	"Albania" => ["41.15699","20.18121"],
	"Algeria" => ["28.02688","1.65284"],
	"American Samoa" => ["-12.7998","-169.6166"],
	"Andorra" => ["42.54690","1.60124"],
	"Angola" => ["-11.20945","17.88067"],
	"Anguilla" => ["18.2350","-63.0978"],
	"Antarctica" => ["-73.04915","0.00000"],
	"Antigua and Barbuda" => ["17.32830","-62.00575"],
	"Antipodean Islands" => ["-49.6749","178.7925"],
	"Antipodes Islands" => ["-49.6749","178.7925"],
	"Antipodes" => ["-49.6749","178.7925"],
	"Argentina" => ["-38.42130","-63.58481"],
	"Armenia" => ["40.0662","45.0399"],
	"Aruba" => ["12.51836","-69.96400"],
	"Australia" => ["-26.69696","142.48622"],
	"Austria" => ["47.69755","13.34932"],
	"Azerbaijan" => ["40.15134","47.57100"],
	"Bahamas" => ["24.6949","-77.4616"],
	"Bahrain" => ["26.03972","50.52517"],
	"Bangladesh" => ["23.60860","90.35100"],
	"Barbados" => ["13.18355","-59.53465"],
	"Belarus" => ["53.71111","27.97384"],
	"Belgium" => ["50.49953","4.47541"],
	"Belize" => ["17.19293","-88.50090"],
	"Benin" => ["9.32205","2.31314"],
	"Bermuda"	=> ["32.3202","-64.7740"],
	"Bhutan" => ["27.51571","90.44246"],
	"Bolivia" => ["-16.28835","-63.54943"],
	"Bosnia and Herzegovina" => ["43.89265","17.67059"],
	"Botswana" => ["-22.34403","24.68039"],
	"Bouvet Island" => ["-54.4314","3.4117"],
	"Brazil" => ["-14.24291","-51.41229"],
	"British Indian Ocean Territory" => ["-6.3326","71.8766"],
	"British Virgin Islands" => ["18.5350","-64.5259"],
	"Brunei Darussalam" => ["4.5251","114.7155"],
	"Brunei" => ["4.5251","114.7155"],
	"Bulgaria" => ["42.72986","25.49166"],
	"Burkina Faso" => ["12.24185","-1.55676"],
	"Burma" => ["19.0718","96.6830"],
	"Burundi" => ["-3.3879","29.9204"],
	"Cambodia" => ["11.98483","104.98386"],
	"Cameroon" => ["7.36530","12.34344"],
	"Canada" => ["62.50617","-96.81815"],
	"Canary Islands" => ["28.5251","-15.7937"],
	"Cape Verde" => ["15.99970","-24.01410"],
	"Cayman Islands" => ["19.5124","-80.5800"],
	"Central African Republic" => ["6.61404","20.94176"],
	"Chad" => ["15.44572","18.73807"],
	"Chile" => ["-36.74352","-71.06394"],
	"China" => ["35.86107","104.16581"],
	"Christmas Island" => ["-10.4958","105.6293"],
	"Cocos (Keeling) Islands" => ["-11.9947","96.8787"],
	"Cocos Islands" => ["-11.9947","96.8787"],
	"Keeling Islands" => ["-11.9947","96.8787"],
	"Colombia" => ["4.57748","-74.29897"],
	"Comoros" => ["-11.88810","43.87701"],
	'Federal Islamic Republic of the Comoros' => ["-11.88810","43.87701"],
	'Comoros, Federal Islamic Republic of the' => ["-11.88810","43.87701"],
	"Congo" => ["-0.66207","14.92742"],
	"Congo, Republic of the" => ["-0.66207","14.92742"],
	"Republic of the Congo" => ["-0.66207","14.92742"],
	"Cook Islands" => ["-15.4441","-161.5851"],
	"Costa Rica" => ["9.62490","-84.25331"],
	"Croatia" => ["44.48731","16.46031"],
	"Cuba" => ["21.71150","-79.54460"],
	"Cyprus" => ["35.13252","33.43550"],
	"Czech Republic" => ["49.80091","15.47815"],
	"Democratic People's Republic of Korea" => ["40.3017","127.4318"],
	"Democratic Peoples Republic of Korea" => ["40.3017","127.4318"],
	"Democratic Republic of the Congo" => ["-4.03479","21.75503"],
	"Congo, Democratic Republic of the" => ["-4.03479","21.75503"],
	"Democratic Yemen" => ["15.35796","48.17329"],
	"Denmark" => ["56.15540","11.61722"],
	"Djibouti" => ["11.80837","42.59521"],
	"Dominica" => ["18.69998","-70.16174"],
	"Dominican Republic" => ["18.69998","-70.16174"],
	"East Timor" => ["-8.8005","125.6971"],
	"Ecuador" => ["-1.78994","-78.09579"],
	"Egypt" => ["26.84220","30.47052"],
	"El Salvador" => ["13.79687","-88.91041"],
	"Equatorial Guinea" => ["2.32941","9.87942"],
	"Eritrea" => ["15.18132","39.79370"],
	"Estonia" => ["58.59620","25.02378"],
	"Ethiopia" => ["9.14809","40.49306"],
	"Falkland Islands" => ["-51.9578","-59.5288"],
	"Faroc Islands" => ["-23.6308","-148.5444"],
	"Faroe Islands" => ["61.8978","-6.8707"],
	"Federal Republic of Germany" => ["51.16572","10.45275"],
	"Federated States of Micronesia" => ["8.4674","150.5438"],
	"Fiji" => ["-16.58015","-0.67220"],
	"Finland" => ["64.95242","25.61499"],
	"France" => ["46.23220","2.38233"],
	"French Guyana" => ["3.95180","-53.07823"],
	"French Polynesia" => ["-17.8770","-144.5752"],
	"Gabon" => ["-0.82810","11.59891"],
	"Galapagos Islands" => ["-0.6223","-90.4509"],
	"Gambia" => ["13.4454","-15.3114"],
	"Georgia" => ["42.31887","43.36580"],
	"Germany" => ["51.16572","10.45275"],
	"Ghana" => ["7.95501","-1.03182"],
	"Gibraltar" => ["36.1361","-5.3484"],
	"Glorioso Islands" => ["-11.5613","47.2902"],
	"Greece" => ["38.34129","23.93976"],
	"Greenland" => ["71.70234","-42.17717"],
	"Grenada" => ["12.15588","-61.68453"],
	"Guadeloupe" => ["16.17391","-61.40358"],
	"Guam" => ["13.4465","144.7866"],
	"Guatamala" => ["15.7763","-90.2323"],
	'Republic of Guinea' => ["9.93489","-11.28384"],
	"Guinea, Republic of" => ["9.93489","-11.28384"],
	"Republic of Guinea" => ["9.93489","-11.28384"],
	"Guinea-Bissau" => ["11.77038","-15.17703"],
	"Guyana" => ["4.86632","-58.93251"],
	"Haiti" => ["19.05443","-73.04597"],
	"Heard Island And Mcdonald Islands" => ["-53.0507","73.2278"],
	"Honduras" => ["14.74633","-86.25310"],
	"Hong Kong Special Administrative Region of China" => ["22.3565","114.1363"],
	"Hong Kong" => ["22.3565","114.1363"],
	"Hungary" => ["47.16463","19.50894"],
	"Hungary, Republic of" => ["47.16463","19.50894"],
	"Iceland" => ["64.96394","-19.02117"],
	"India" => ["21.12568","82.78307"],
	"Indonesia" => ["-2.55022","118.01557"],
	"Iran (Islamic Republic of)" => ["32.42065","53.68236"],
	"Iran, Islamic Republic of" => ["32.42065","53.68236"],
	"Iran" => ["32.42065","53.68236"],
	"Iraq" => ["33.21634","43.68589"],
	"Ireland" => ["53.41974","-8.24047"],
	"Israel" => ["31.38941","34.96023"],
	"Italy" => ["41.29370","12.56418"],
	"Ivory Coast" => ["7.5469","-5.5471"],
	"Côte d'Ivoire" => ["7.5469","-5.5471"],
	"Jamaica" => ["18.11526","-77.27348"],
	"Japan" => ["34.77980","138.46188"],
	"Jordan" => ["31.27678","37.13059"],
	"Kazakhstan" => ["48.19376","66.90226"],
	"Kenya" => ["0.17095","37.90397"],
	"Kermadec Islands" => ["-29.8863","-178.2544"],
	"Kiribati" => ["-3.38270","9.62645"],
	"Korea, Democratic Peoples Republic of" => ["40.3017","127.4318"],
	"Democratic Peoples Republic of Korea" => ["40.3017","127.4318"],
	"Korea, Republic of" => ["36.0575","127.3356"],
	"Republic of Korea" => ["36.0575","127.3356"],
	"Kuwait" => ["29.31028","47.49351"],
	"Kyrgyzstan" => ["41.20554","74.77990"],
	"Lao People's Democratic Republic" => ["18.20521","103.89504"],
	"Laos" => ["18.20521","103.89504"],
	"Latvia" => ["56.87558","24.60771"],
	"Lebanon" => ["33.87263","35.87673"],
	"Lesotho" => ["-29.62051","28.24741"],
	"Liberia" => ["6.45242","-9.42860"],
	"Libya" => ["26.33853","17.19351"],
	"Libyan Arab Jamahiriya" => ["26.33853","17.19351"],
	"Liechtenstein" => ["47.16470","9.55500"],
	"Lithuania" => ["55.17410","23.96007"],
	"Luxembourg" => ["49.81576","6.13151"],
	"Macau" => ["22.1665","113.5600"],
	"The Former Yugoslav Republic of Macedonia" => ["41.61100","21.75141"],
	"Macedonia, The Former Yugoslav Republic of" => ["41.61100","21.75141"],
	"Madagascar" => ["-18.77719","46.83758"],
	"Madeira Islands" => ["32.7495","-16.7756"],
	"Malawi" => ["-13.24627","34.29539"],
	"Malaysia" => ["5.08949","109.10126"],
	"Maldives" => ["3.20283","73.19503"],
	"Mali" => ["17.57976","-3.99882"],
	"Malta" => ["35.94615","14.38461"],
	"Marshall Islands" => ["9.61501","168.71101"],
	"Martinique" => ["14.6355","-61.0228"],
	"Mauritania" => ["21.00681","-10.94710"],
	"Mauritius" => ["-20.25542","57.55174"],
	"Mayotte" => ["-12.8170","45.1538"],
	"Mexico" => ["23.62481","-102.59446"],
	"Micronesia" => ["8.4674","150.5438"],
	"Micronesia, Federated States" => ["8.4674","150.5438"],
	"Federated States of Micronesia" => ["8.4674","150.5438"],
	"Midway Island" => ["28.3225","-177.8170"],
	"Moldova" => ["46.97954","28.37717"],
	"Monaco" => ["43.75075","7.42401"],
	"Mongolia" => ["46.86094","103.83698"],
	"Montserrat" => ["16.7442","-62.1945"],
	"Morocco" => ["31.79507","-7.08016"],
	"Mozambique" => ["-18.67028","35.53090"],
	"Namibia" => ["-22.9657","18.4862"],
	"Nauru" => ["-0.52832","166.92216"],
	"Nepal" => ["28.39505","84.12780"],
	"Netherlands Antilles" => ["15.01941","-66.05044"],
	"Netherlands" => ["52.11200","5.29500"],
	"Holland" => ["52.11200","5.29500"],
	"Netherlands, Antilles" => ["15.01941","-66.05044"],
	"Netherlands, Kingdom of the" => ["52.11200","5.29500"],
	"New Caledonia" => ["-21.1322","166.2593"],
	"New Zealand" => ["-40.71078","172.48664"],
	"Nicaragua" => ["12.86673","-85.21430"],
	"Niger, Republic of" => ["17.61100","8.08095"],
	"Republic of Niger" => ["17.61100","8.08095"],
	"Nigeria" => ["9.08458","8.67425"],
	"Norfolk Island" => ["-29.0559","167.9582"],
	"North Korea" => ["40.3017","127.4318"],
	"Northern Mariana Islands" => ["17.3251","145.4837"],
	"Norway" => ["64.58302","18.00739"],
	"Oman" => ["21.51686","55.85929"],
	"Pakistan" => ["30.39585","69.35975"],
	"Palau" => ["5.5470","132.9465"],
	"Panama" => ["8.41771","-80.11278"],
	"Papua New Guinea" => ["-6.26787","150.16053"],
	"Paracel Islands" => ["16.3543","111.9651"],
	"Paraguay" => ["-23.45139","-58.45321"],
	"Peru" => ["-9.18135","-75.00237"],
	"Philippines" => ["12.86703","121.18392"],
	"Pitcairn Islands" => ["-24.4930","-127.7594"],
	"Pitcairn" => ["-24.4930","-127.7594"],
	"Poland" => ["51.92275","19.13687"],
	"Portugal" => ["39.56316","-7.83932"],
	"Prince Edward Islands" => ["-46.7943","37.7964"],
	"Puerto Rico" => ["18.2016","-66.5814"],
	"Qatar" => ["25.33026","51.58592"],
	"Republic of Korea" => ["36.0575","127.3356"],
	"Republic of Moldova" => ["46.9795","28.3772"],
	"Romania" => ["45.94711","24.98050"],
	"Russia" => ["61.52311","105.06381"],
	"Russian Federation" => ["61.52311","105.06381"],
	"Rwanda" => ["-1.94708","29.87638"],
	"Saint Helena" => ["-11.9541","-10.0300"],
	"Saint Kitts and Nevis" => ["17.2577","-62.7064"],
	"Saint Lucia" => ["13.9040","-60.9742"],
	"Saint Pierre and Miquelon" => ["46.9498","-56.2934"],
	"Saint Vincent and the Grenadines" => ["12.8923","-61.3074"],
	"San Marino" => ["43.94886","12.45871"],
	"Sao Tome and Principe" => ["0.84366","6.96827"],
	"Saudi Arabia" => ["23.88629","45.08114"],
	"Senegal" => ["14.49945","-14.44556"],
	"Serbia" => ["44.0660","20.9225"],
	"Seychelles" => ["-6.95261","51.23936"],
	"Sierra Leone" => ["8.46481","-11.79593"],
	"Singapore" => ["1.31765","103.86417"],
	"Slovakia" => ["48.66563","19.70909"],
	"Slovenia" => ["46.14553","14.97454"],
	"Solomon Islands" => ["-8.6851","162.1761"],
	"Solomon Islands" => ["-8.68510","162.17606"],
	"Somalia" => ["5.16157","46.20083"],
	"South Africa" => ["-28.48322","24.67700"],
	"South Georgia And The South Sandwich Islands" => ["-56.5656","-34.0227"],
	"South Korea" => ["36.0575","127.3356"],
	"Spain" => ["39.90307","-2.48769"],
	"Spratly Islands" => ["10.3987","114.5249"],
	"Sri Lanka" => ["7.87409","80.76710"],
	"Sudan" => ["13.31664","30.20949"],
	"Suriname" => ["3.91785","-56.03203"],
	"Swaziland" => ["-26.51837","31.46568"],
	"Sweden" => ["62.19981","17.63980"],
	"Switzerland" => ["46.81552","8.22446"],
	"Syria" => ["34.81491","39.00233"],
	"Syrian Arab Republic" => ["34.81491","39.00233"],
	"Taiwan Province of China" => ["23.60003","120.65415"],
	"Taiwan" => ["23.60003","120.65415"],
	"Tajikistan" => ["38.85819","71.26218"],
	"Tanzania" => ["-6.36822","34.88519"],
	"Thailand" => ["13.03660","101.49250"],
	"The former Yugoslav Republic of Macedonia"  => ["41.61100","21.75141"],
	"Togo" => ["8.62170","0.82968"],
	"Tonga" => ["-18.95435","-174.95756"],
	"Trinidad and Tobago" => ["10.68722","-61.20666"],
	"Tunisia" => ["33.79502","9.56155"],
	"Turkey" => ["38.96151","35.25174"],
	"Turkmenistan" => ["38.96832","59.56287"],
	"Turks and Caicas Islands" => ["22.0124","-72.7319"],
	"Tuvalu" => ["-7.53908","177.96411"],
	"Uganda" => ["1.36519","32.30465"],
	"Ukraine" => ["48.37989","31.16814"],
	"United Arab Emirates" => ["24.28796","53.74409"],
	"United Kingdom" => ["55.40342","-3.21145"],
	"UK" => ["55.40342","-3.21145"],
	"GB" => ["55.40342","-3.21145"],
	"Britain" => ["55.40342","-3.21145"],
	"Great Britain" => ["55.40342","-3.21145"],
	"United Kingdom of Great Britain and Northern Island" => ["55.40342","-3.21145"],
	"United Republic of Tanzania" => ["-6.36822","34.88519"],
	"United States Virgin Islands" => ["18.0699","-64.8257"],
	"United States of America" => ["38.15217","-100.25006"], # ["45.15217","-127.25006"],
	"United States" => ["38.15217","-100.25006"],
	"America" => ["38.15217","-100.25006"],
	"USA" => ["38.15217","-100.25006"],
	"Uruguay" => ["-32.53152","-55.75833"],
	"Uzbekistan" => ["41.37967","64.56445"],
	"Vanuatu" => ["-16.66119","168.21488"],
	"Venezuela" => ["6.41411","-66.57893"],
	"Viet Nam" => ["15.89854","105.80642"],
	"Vietnam" => ["15.89854","105.80642"],
	"Virgin Islands, British" => ["18.5350","-64.5259"],
	"Virgin Islands, U.S." => ["18.0699","-64.8257"],
	"Western Sahara" => ["24.2219","-12.8867"],
	"Western Samoa" => ["-13.74787","-172.10396"],
	"Independent State of Samoa" => ["-13.74787","-172.10396"],
	"Yemen" => ["15.35796","48.17329"],
	"Zaire" => ["-4.03479","21.75503"],
	"Zambia" => ["-13.15192","27.85254"],
	"Zimbabwe" => ["-19.01329","29.14667"],
 	"Guatemala" => ["15.7763","-90.2323"],
 	"Niue" => ["-19.0516","-169.8631"],

	"Yugoslavia" => ["44.0660","20.9225"], # serbia
	"European Union" => ["51","4.5"],	# Near Brussels
	"EU" => ["51","4.5"],	# European Union
	"EEC" => ["51","4.5"],	# European Union
};

=head2 latlong ($country_name)

Returns as a 1x2 anonymous array the latitude and longitude
for the country supplied as the sole argument, or C<undef> if
the country is not supported.

=cut

sub latlong ($) {
	my $country = shift;
	return undef if not $country;
	return undef if not exists $countries_latlong->{$country};
	return wantarray? @{$countries_latlong->{$country}} : $countries_latlong->{$country};
}


=head2 supports ($country)

Returns a true value if the sole argument is a country name supported by this module;
otherwise, returns C<undef>.

=cut

sub supports ($) {
	my $country = shift;
	return undef unless $country;
	return exists $countries_latlong->{$country};
}

=head2 unsupported

C<warn>s to C<STDERR> a list of C<Geography::Countries::countries>
that are not supported by this module.

=cut

sub unsupported {
	warn "The following are not supported by ".__PACKAGE__.":\n";
	foreach (&Geography::Countries::countries){
		if (ref $countries_latlong->{$_} ne 'ARRAY'){
			warn "\t$_\n";
		}
	}
}


=head2 country

Just C<Geography::Countries>'s routine.

=cut

sub country {
	return Geography::Countries::country(@_);
}


1;

__END__



=head1 UNSUPPORTED NAMES

It is no reflection on the countries listed: I just don't have the data at the time of writing.


	Democratic Kampuchea
	Faeroe Islands
	French Guiana
	French Southern Territories
	Holy See
	Melanesia
	Micronesia-Polynesia
	Myanmar
	Pacific Islands (Trust Territory)
	Svalbard and Jan Mayen Islands
	Tokelau
	Turks and Caicos Islands
	Upper Volta
	Wallis and Futuna Islands

=head1 AUTHOR

Lee Goddard - lgoddard -at- cpan -dot- org

=head1 SEE ALSO

L<perl>, L<Geography::Countries>.

=head1 COPYRIGHT

Copyright (C) Lee Goddard, 2003, 2006. All Rights Reserved.
Made publically available under the same terms as Perl itself.
