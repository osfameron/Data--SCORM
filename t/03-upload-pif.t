#!perl

use strict; use warnings;

use FindBin qw/ $Bin /;
use Data::Dumper;
use Data::SCORM;
use Test::LongString;
use Path::Class 'file';

diag( "Testing Data::SCORM::Manifest $Data::SCORM::Manifest::VERSION, Perl $], $^X" );

my @files; 
my %json;
# Should be done in config?
BEGIN {
  @files = glob("$Bin/pifs/*.zip");
  %json = (
	'ContentPackagingSingleSCO_SCORM20043rdEdition.zip' => <<JSON,
{"organizations":{"default":{"resources":[{"identifier":"resource_1","href":"shared/launchpage.html","file":["http://test.example.com/scorms/scorm1/Etiquette/Course.html","http://test.example.com/scorms/scorm1/Etiquette/course.jpg","http://test.example.com/scorms/scorm1/Etiquette/Distracting.html","http://test.example.com/scorms/scorm1/Etiquette/distracting.jpg","http://test.example.com/scorms/scorm1/Etiquette/Play.html","http://test.example.com/scorms/scorm1/Etiquette/play.jpg","http://test.example.com/scorms/scorm1/Etiquette/questions.js","http://test.example.com/scorms/scorm1/Handicapping/calchandi.jpg","http://test.example.com/scorms/scorm1/Handicapping/calcscore.jpg","http://test.example.com/scorms/scorm1/Handicapping/CalculatingHandicap.html","http://test.example.com/scorms/scorm1/Handicapping/CalculatingScore.html","http://test.example.com/scorms/scorm1/Handicapping/Example.html","http://test.example.com/scorms/scorm1/Handicapping/example.jpg","http://test.example.com/scorms/scorm1/Handicapping/Overview.html","http://test.example.com/scorms/scorm1/Handicapping/overview.jpg","http://test.example.com/scorms/scorm1/Handicapping/questions.js","http://test.example.com/scorms/scorm1/HavingFun/friends.jpg","http://test.example.com/scorms/scorm1/HavingFun/fun.jpg","http://test.example.com/scorms/scorm1/HavingFun/HowToBeStylish.html","http://test.example.com/scorms/scorm1/HavingFun/HowToHaveFun.html","http://test.example.com/scorms/scorm1/HavingFun/MakeFriends.html","http://test.example.com/scorms/scorm1/HavingFun/questions.js","http://test.example.com/scorms/scorm1/HavingFun/stylish.jpg","http://test.example.com/scorms/scorm1/Playing/otherscoreing.jpg","http://test.example.com/scorms/scorm1/Playing/OtherScoring.html","http://test.example.com/scorms/scorm1/Playing/Par.html","http://test.example.com/scorms/scorm1/Playing/par.jpg","http://test.example.com/scorms/scorm1/Playing/Playing.html","http://test.example.com/scorms/scorm1/Playing/playing.jpg","http://test.example.com/scorms/scorm1/Playing/questions.js","http://test.example.com/scorms/scorm1/Playing/rules.jpg","http://test.example.com/scorms/scorm1/Playing/RulesOfGolf.html","http://test.example.com/scorms/scorm1/Playing/Scoring.html","http://test.example.com/scorms/scorm1/Playing/scoring.jpg","http://test.example.com/scorms/scorm1/shared/assessmenttemplate.html","http://test.example.com/scorms/scorm1/shared/background.jpg","http://test.example.com/scorms/scorm1/shared/cclicense.png","http://test.example.com/scorms/scorm1/shared/contentfunctions.js","http://test.example.com/scorms/scorm1/shared/launchpage.html","http://test.example.com/scorms/scorm1/shared/scormfunctions.js","http://test.example.com/scorms/scorm1/shared/style.css"],"type":"webcontent"}],"identifier":"golf_sample_default_org","title":"Golf Explained - CP Single SCO","items":[null]},"golf_sample_default_org":{"resources":[{"identifier":"resource_1","href":"shared/launchpage.html","file":["http://test.example.com/scorms/scorm1/Etiquette/Course.html","http://test.example.com/scorms/scorm1/Etiquette/course.jpg","http://test.example.com/scorms/scorm1/Etiquette/Distracting.html","http://test.example.com/scorms/scorm1/Etiquette/distracting.jpg","http://test.example.com/scorms/scorm1/Etiquette/Play.html","http://test.example.com/scorms/scorm1/Etiquette/play.jpg","http://test.example.com/scorms/scorm1/Etiquette/questions.js","http://test.example.com/scorms/scorm1/Handicapping/calchandi.jpg","http://test.example.com/scorms/scorm1/Handicapping/calcscore.jpg","http://test.example.com/scorms/scorm1/Handicapping/CalculatingHandicap.html","http://test.example.com/scorms/scorm1/Handicapping/CalculatingScore.html","http://test.example.com/scorms/scorm1/Handicapping/Example.html","http://test.example.com/scorms/scorm1/Handicapping/example.jpg","http://test.example.com/scorms/scorm1/Handicapping/Overview.html","http://test.example.com/scorms/scorm1/Handicapping/overview.jpg","http://test.example.com/scorms/scorm1/Handicapping/questions.js","http://test.example.com/scorms/scorm1/HavingFun/friends.jpg","http://test.example.com/scorms/scorm1/HavingFun/fun.jpg","http://test.example.com/scorms/scorm1/HavingFun/HowToBeStylish.html","http://test.example.com/scorms/scorm1/HavingFun/HowToHaveFun.html","http://test.example.com/scorms/scorm1/HavingFun/MakeFriends.html","http://test.example.com/scorms/scorm1/HavingFun/questions.js","http://test.example.com/scorms/scorm1/HavingFun/stylish.jpg","http://test.example.com/scorms/scorm1/Playing/otherscoreing.jpg","http://test.example.com/scorms/scorm1/Playing/OtherScoring.html","http://test.example.com/scorms/scorm1/Playing/Par.html","http://test.example.com/scorms/scorm1/Playing/par.jpg","http://test.example.com/scorms/scorm1/Playing/Playing.html","http://test.example.com/scorms/scorm1/Playing/playing.jpg","http://test.example.com/scorms/scorm1/Playing/questions.js","http://test.example.com/scorms/scorm1/Playing/rules.jpg","http://test.example.com/scorms/scorm1/Playing/RulesOfGolf.html","http://test.example.com/scorms/scorm1/Playing/Scoring.html","http://test.example.com/scorms/scorm1/Playing/scoring.jpg","http://test.example.com/scorms/scorm1/shared/assessmenttemplate.html","http://test.example.com/scorms/scorm1/shared/background.jpg","http://test.example.com/scorms/scorm1/shared/cclicense.png","http://test.example.com/scorms/scorm1/shared/contentfunctions.js","http://test.example.com/scorms/scorm1/shared/launchpage.html","http://test.example.com/scorms/scorm1/shared/scormfunctions.js","http://test.example.com/scorms/scorm1/shared/style.css"],"type":"webcontent"}],"identifier":"golf_sample_default_org","title":"Golf Explained - CP Single SCO","items":[null]}},"metadata":{"schemaversion":"2004 3rd Edition","schema":"ADL SCORM"}}
JSON
  );
}

use Test::More tests => (scalar @files * 11) + scalar keys %json;

for my $file (@files) {
  SKIP: {
	my $s = eval { Data::SCORM->extract_from_pif( $file ) };
	ok ($s, "Extracted Scorm $s")
		or do {
			diag $@;
			skip "Couldn't even parse", 10;
		  };

	isa_ok $s, 'Data::SCORM';
	my $manifest = $s->manifest;
	isa_ok $manifest, 'Data::SCORM::Manifest';

	my $path = $s->path;
	diag "Unpacked to $path";
	isa_ok $path, 'Path::Class::Dir'
		or skip "No path", 7;

	ok ($path->file('imsmanifest.xml')->stat, "Found manifest")
		or skip "Couldn't find manifest", 6;

	my $s2 = eval { Data::SCORM->from_dir( $path ) };

	ok ($s2, "Extracted Scorm $s")
		or do {
			diag $@;
			skip "Couldn't even parse", 5;
		  };

	isa_ok $s2, 'Data::SCORM';
	my $manifest2 = $s2->manifest;
	isa_ok $manifest2, 'Data::SCORM::Manifest';

	my $path2 = $s2->path;
	isa_ok $path2, 'Path::Class::Dir'
		or skip "No path", 2;
	
	is        $path,     $path2,     "Same path";
	is_deeply $manifest, $manifest2, "Same manifest";

	diag "Delete $path ?";

	my $filepart = file($file)->basename;
	if (my $json_expected = $json{$filepart}) {
		my $json = $manifest->to_json('http://test.example.com/scorms/scorm1');
		is_string ("$json\n", $json_expected)
            or diag $json;
	}
	# system 'rm', '-rf', $path;
  }
}

