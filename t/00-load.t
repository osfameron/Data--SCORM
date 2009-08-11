#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Data::SCORM::Manifest' );
}

diag( "Testing Data::SCORM::Manifest $Data::SCORM::Manifest::VERSION, Perl $], $^X" );
