#NQ-BCS316
#Exercise 2 - Make a program that looks through a given string for every occurrence 
#of a given substring, printing out the positions where the substring is found. 
#For example, given the input string "This is a test." and the substring "is", 
#it should report positions 2 and 5. If the substring were "a", it should report 8. 
#What does it report if the substring is "t"?  
use 5.23.0;
use strict;
use warnings;

#Sets the string to search through and the substring to find:
my $string = "This is a test.";
my $substring = "is";

#Initializes the starting position of the search to 0:
my $start_pos = 0;

#Loops through the string and look for the substring:
while (($start_pos = index($string, $substring, $start_pos)) != -1) {
    #If the substring is found, prints out its position:
    print "Found '$substring' at position $start_pos\n";

    #Updates the starting position to immediately follow the current occurrence of the substring:
    $start_pos += length $substring;
}
