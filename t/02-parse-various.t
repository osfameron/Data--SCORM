#!perl

use strict; use warnings;

use FindBin qw/ $Bin /;
use Data::Dumper;
use Data::SCORM::Manifest;

diag( "Testing Data::SCORM::Manifest $Data::SCORM::Manifest::VERSION, Perl $], $^X" );

my @files;
BEGIN {
  @files = glob("$Bin/manifests/imsmanifest*xml");
}
use Test::More tests => (scalar @files * 5);

for my $file (@files) {
  SKIP: {
	my $m = eval { Data::SCORM::Manifest->parsefile($file) };
	ok ($m, "Parsed Scorm $file")
		or do {
			diag $@;
			skip "Couldn't even parse", 4;
		  };

	isa_ok $m, 'Data::SCORM::Manifest';

	my $org = $m->get_default_organization();
	isa_ok $org, 'Data::SCORM::Organization';

	my $item = $org->get_item(0);
	isa_ok $item, 'Data::SCORM::Item';

	diag $item->identifier;
	my $resource = $item->resource;
	isa_ok $resource, 'Data::SCORM::Resource';
	diag $resource->identifier;
  }
}

