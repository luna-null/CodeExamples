my $x = "foo";
my $some_condition = 1;
if ($some_condition) 
{
	my $y = "bar";
	print $x;           # prints "foo"
	print $y;           # prints "bar"
}
print $x;               # prints "foo"
print $y;               # prints nothing; $y has fallen out of scope
