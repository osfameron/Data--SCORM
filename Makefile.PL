use inc::Module::Install;

name     'Data-SCORM-Manifest';
all_from 'lib/Data/SCORM/Manifest.pm';
author   q{OSFAMERON <osfameron@cpan.org>};
license  'perl';

build_requires 'Test::More';

requires 'Any::Moose';
requires 'Mouse';
requires 'MouseX::AttributeHelpers';
requires 'Mouse::Util::TypeConstraints';
requires 'Scalar::Util';
requires 'XML::Twig';
requires 'Archive::Extract';
requires 'File::Temp';

auto_install;

WriteAll;

