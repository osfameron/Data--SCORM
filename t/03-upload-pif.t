#!perl

use strict; use warnings;

use FindBin qw/ $Bin /;
use Data::Dumper;
use Data::SCORM;

diag( "Testing Data::SCORM::Manifest $Data::SCORM::Manifest::VERSION, Perl $], $^X" );

my @files;
BEGIN {
  @files = glob("$Bin/pifs/*.zip");
}
use Test::More tests => (scalar @files * 11);

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
	# system 'rm', '-rf', $path;
  }
}

