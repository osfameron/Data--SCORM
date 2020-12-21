package Data::SCORM::Types;

use Moose;
use Moose::Util::TypeConstraints;


coerce 'Bool'
	=> from 'Str'
	=> via  {
			{
        false => undef,
			  true  => 1,
      }->{$_}
    };

1;
