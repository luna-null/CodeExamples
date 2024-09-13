#!/usr/bin/env perl


# The process of trying one alternative, seeing if it matches, 
# and moving on to the next alternative, while going back in 
# the string from where the previous alternative  was  tried, 
# if it doesn't, is called backtracking. The term "backtracking" 
# comes from the idea that matching a regex is like a walk in the 
# woods.  Successfully matching a regex is like arriving  at  a  
# destination. There are many possible  trailheads, one for each 
# string position, and each one is tried in order, left to right.  
# From each trailhead there may be many paths, some of which get 
# you there, and some which are dead ends. When you walk along a 
# trail and hit a dead end, you have to backtrack along the trail 
# to an earlier point to try another trail. If you hit your 
# destination, you stop immediately and forget about trying all 
# the other trails. You are persistent, and only if you have tried 
# all the trails from all the trailheads and not arrived at your 
# destination, do you declare failure.





use strict;
use warnings;

my $greeting = "World";


if (m+World+) {
	print "Delimiters don't have to be /'s!\n";
}
else {
	print "Nvm... :(\n";
}

my $dollar = "1000\t2000";

if ($dollar =~ m[0\t2]) {
	print "$dollar\n";
}
else {
	print "1000 2000\n";
}

my $x = "x";

if ("Hello" =~ /[$x]/) {
	print "$x\n";
} 
else {
	print "y\n";
}

if ("á" =~ /[^0-9a-zA-Z ]/ ) { print  "Hello!\n"; }
else { print "Goodbye!\n"; }
      # •   "\d" matches a digit, not just "[0-9]" but also digits from non-roman scripts
      #
      #  •   "\s" matches a whitespace character, the set "[\ \t\r\n\f]" and others
      #
      #  •   "\w" matches a word character (alphanumeric or '_'), not just "[0-9a-zA-Z_]" but also digits and characters from non-roman scripts
      #
      #  •   "\D" is a negated "\d"; it represents any other character than a digit, or "[^\d]"
      #
      #  •   "\S" is a negated "\s"; it represents any non-whitespace character "[^\s]"
      #
      #  •   "\W" is a negated "\w"; it represents any non-word character "[^\w]"
      #
      #  •   The period '.' matches any character but "\n" (unless the modifier "/s" is in effect, as explained below).
      #
      #  •   "\N", like the period, matches any character but "\n", but it does so regardless of whether the modifier "/s" is in effect.

if ("Hello World" =~ /./) {
	printf "The period matches anything other than \\n!\n";
}
else {
	print "Periods don't match shit >:(";
}

if ("aa\\a\\ aa" =~ /\ba\b/) {print "\\b matches with the boundary (i.e. a non-word character) blargh\n";}

my $xs = "There once was a girl\nWho programmed in Perl\n";

if ($xs =~ /^Who/sm ) { print "I'm a girl programming in perl.\n";}

if ($xs =~ /\AWho/m) { print "Was a good try anyway.\n";}

if ("Hiiiii" =~ /(i|H)i/ ) { print "$1\n";}

my $time = "11:22:33";
print "$time";

if ($time =~ /(\d\d):(\d\d):(\d\d)/) {    # match hh:mm:ss format
	my $hours = $1;
	my $minutes = $2;
	my $seconds = $3;

	printf "$hours::$minutes::$seconds\n";
}

my $a99a = '([a-z])(\d)\g{-1}\g{-2}';
my $line = "code=e99e";
if ($line =~ /^(\w+)=$a99a$/){   # unexpected behavior!
print "$1 is valid\n";
} else {
print "bad line: '$line'\n";
}

# "?<_>" capture group patterns as a variable, then save it in the hash %+
my $fmt1 = '(?<y>\d\d\d\d)-(?<m>\d\d)-(?<d>\d\d)';
my $fmt2 = '(?<m>\d\d)/(?<d>\d\d)/(?<y>\d\d\d\d)';
my $fmt3 = '(?<d>\d\d)\.(?<m>\d\d)\.(?<y>\d\d\d\d)';
for my $d (qw(2006-10-21 15.01.2007 10/31/2005)) {
	if ( $d =~ m{$fmt1|$fmt2|$fmt3} ){
	   print "day=$+{d} month=$+{m} year=$+{y}\n";	# Using a scalar of the hash defined from the regex.
	}
}

if($time =~ /(?|(\d\d|\d):(\d\d)|(\d\d)(\d\d))\s+([A-Z][A-Z][A-Z])/){
print "hour=$1 minute=$2 zone=$3\n";
}

$x = "Mmm...donut, thought Homer";
$x =~ /^(Mmm|Yech)\.\.\.(donut|peas)/; # matches
foreach my $exp (1..$#-) {	# $- is the beginning position of where the rexex input matched, and $+ is the end match
	no strict 'refs';
	print "Match $exp: '$$exp' at position ($-[$exp],$+[$exp])\n";
}

$x = "the cat caught the mouse";
$x =~ /cat/;  # $` = 'the ', $& = 'cat', $' = ' caught the mouse'
$x =~ /the/;  # $` = '', $& = 'the', $' = ' cat caught the mouse'

# $` is the same as ${^PREMATCH} is the same as substr( $x, 0, $-[0] )
# $& is the same as ${^MATCH} is the same as substr( $x, $-[0], $+[0]-$-[0] )
# $' is the same as ${^POSTMATCH} is the same as substr( $x, $+[0] )

$x = '12aba34ba5';
my @num = split /(a|b)+/, $x;    # @num = ('12','a','34','a','5')
@num = split /(?:a|b)+/, $x;  # @num = ('12','34','5')

"hello" =~ /(hi|hello)/n; # $1 is not set!

# •   "a?" means: match 'a' 1 or 0 times
#
# •   "a*" means: match 'a' 0 or more times, i.e., any number of times
#
# •   "a+" means: match 'a' 1 or more times, i.e., at least once
#
# •   "a{n,m}" means: match at least "n" times, but not more than "m" times.
#
# •   "a{n,}" means: match at least "n" or more times
#
# •   "a{,n}" means: match at most "n" times, or fewer
#
# •   "a{n}" means: match exactly "n" times
#


# •	Principle 0: Taken as a whole, any regex will be 
#	matched at the earliest possible position in the string.
#
# •	Principle 1: In an alternation "a|b|c...", the leftmost 
#	alternative that allows a match for the whole regex will 
#	be the one used.
#
# •	Principle  2:  The  maximal  matching quantifiers '?', '*', 
#	'+' and "{n,m}" will in general match as much of the string 
#	as possible while still allowing the whole regex to match.
#
# •	Principle 3: If there are two or more elements in a regex, 
#	the leftmost greedy (non-greedy) quantifier, if any, will 
#	match as much (little) of the string as possible while still 
#	allowing the whole regex to match. The next leftmost greedy 
#	(non-greedy) quantifier, if any, will try to match as much 
#	(little) of the string remaining available to it as possible,
#	while still allowing the whole regex to match. And so on, 
#	until all the regex elements are satisfied.




# Non greedy quantifier '([*+?{n,m}]?)' (The second question mark)
$x = "The programming republic of Perl";
   $x =~ /^(.+?)(e|r)(.*)$/; # matches,
			     # $1 = 'Th'
			     # $2 = 'e'
			     # $3 = ' programming republic of Perl'

$x =~ /(m{1,2}?)(.*?)$/;  # matches,
			     # $1 = 'm'
			     # $2 = 'ming republic of Perl'

$x =~ /(.*?)(m{1,2}?)(.*)$/;  # matches,
				 # $1 = 'The progra'
				 # $2 = 'm'
				 # $3 = 'ming republic of Perl

/^[+-]?(\d+\.\d+|\d+\.|\.\d+|\d+)([eE][+-]?\d+)?$/;  # Regex pattern for a floating point number.
# /^			     [+-]?	      (\d+\.)...)				  ([eE]...)		$/;
# (Beginning of string) >>=  (Maybe sign) >>= (At least one number character	      >>= (Maybe exponent) >>=  (End of string/line)
					      # with a dot on either side of it, 
					      # and then maybe more number characters)
# Beautiful regex (with /x modifier):
# /^
#           [+-]?\ *      # first, match an optional sign *and space*
#           (             # then match integers or f.p. mantissas:
#               \d+\.\d+  # mantissa of the form a.b
#              |\d+\.     # mantissa of the form a.
#              |\.\d+     # mantissa of the form .b
#              |\d+       # integer of the form a
#           )
#           ( [eE] [+-]? \d+ )?  # finally, optionally match an exponent
#        $/x;
# More beautiful regex (with /xx modifier):
# /^
#    [ + - ]?\ *   # first, match an optional sign
#    (             # then match integers or f.p. mantissas:
#        \d+       # start out with a ...
#        (
#            \.\d* # mantissa of the form a.b or a.
#        )?        # ? takes care of integers of the form a
#       |\.\d+     # mantissa of the form .b
#    )
#    ( [ e E ] [ + - ]? \d+ )?  # finally, optionally match an exponent
# $/xx;
# Compact form:
/^[+-]?\ *(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?$/;

# Global matching:
$x = "cat dog house"; # 3 words
$x =~ /^\s*(\w+)\s+(\w+)\s+(\w+)\s*$/; # matches,
				  # $1 = 'cat'
				  # $2 = 'dog'
				  # $3 = 'house'
# /g allows for continuous looping over the regex pattern to add to the group vars the regex assigns:
while ($x =~ /(\w+)/g) {
       print "Word is $1, ends at position ", pos $x, "\n";
   }
my @words = ($x =~ /(\w+)/g);  # matches,
		       # $words[0] = 'cat'
		       # $words[1] = 'dog'
		       # $words[2] = 'house'
# /g resets position if there's a failure to match. Adding /c would prevent this.

# \G is an anchor that matches at the point that /g left off:
my $metric = 1;  # use metric units
while (<>) {
   # $x = <>;  # read in measurement
   $x =~ /^([+-]?\d+)\s*/g;  # get magnitude
   my $weight = $1;
   if ($metric) { # error checking
       print "Units error!" unless $x =~ /\Gkg\./g;
   }
   else {
       print "Units error!" unless $x =~ /\Glbs\./g;
   }
   $x =~ /\G\s+(widget|sprocket)/g;  # continue processing
}


# expanded, this is "ATC GTT GAA TGC AAA TGA CAT GAC"
my $dna = "ATCGTTGAATGCAAATGACATGAC";
$dna =~ /TGA/;

while ($dna =~ /\G(\w\w\w)*?TGA/g) {
	print "Got a TGA stop codon at position ", pos $dna, "\n";
}
# Without the \G, after the first match, the regex will 
# just loop over each singular character instead of 
# three-character groupings. \G also allows for not resetting
# the array number from regex matches every time.


$x = "I like dogs.";
my $y = $x =~ s/dogs/cats/r;
print "$x $y\n";

$x = "/usr/bin/perl";
my @dirs = split m!/!, $x;  # $dirs[0] = ''
		    # $dirs[1] = 'usr'
		    # $dirs[2] = 'bin'
		    # $dirs[3] = 'perl'
my @parts = split m!(/)!, $x;  # $parts[0] = ''
		       # $parts[1] = '/'
		       # $parts[2] = 'usr'
		       # $parts[3] = '/'
		       # $parts[4] = 'bin'
		       # $parts[5] = '/'
		       # $parts[6] = 'perl'

$x = "perl";
my $string =~ /\u$x/;  # matches 'Perl' in $string
$x = "M(rs?|s)\\."; # note the double backslash
$string =~ /\l$x/;  # matches 'mr.', 'mrs.', and 'ms.',

$x = "This word is in lower case:\L SHOUT\E";
   $x =~ /shout/;       # matches
   $x = "I STILL KEYPUNCH CARDS FOR MY 360";
   $x =~ /\Ukeypunch/;  # matches punch card string


$x = "\QThat !^*&%~& cat!";
$x =~ /\Q!^*&%~&\E/;  # check for rough language with \Q...\E . Protects most non-alphabetic chars (except for $ and @).

# Unicode hex number
/\x{263a}/;   # match a Unicode smiley face :)
/\x{ 263a }/; # Same

# Unicode names
$x = "abc\N{MERCURY}def";
$x =~ /\N{MERCURY}/;   # matches
$x =~ /\N{ MERCURY }/; # Also matches

print "\N{GREEK SMALL LETTER SIGMA} is called sigma.\n";
print "\N{greek:Sigma} is an upper-case sigma.\n";

use charnames qw(greek);
print "\N{sigma} is Greek sigma\n";
/\p{Name=greek small letter sigma}/

$x = "BOB";
$x =~ /^\p{IsUpper}/;   # matches, uppercase char class
$x =~ /^\P{IsUpper}/;   # doesn't match, char class sans uppercase
$x =~ /^\p{IsLower}/;   # doesn't match, lowercase char class
$x =~ /^\P{IsLower}/;   # matches, char class sans lowercase
