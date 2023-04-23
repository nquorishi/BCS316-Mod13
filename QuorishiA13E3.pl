#NQ-BCS316
#Exercise 3 - Fill an array with the following strings: “Bart”, “Lisa”, “Maggie” and 
#“Homer”. Sort the array alphabetically, but looking at the words backwards.  
#You are welcome to use your own selection of names if you prefer.
use 5.23.0;
use strict;
use warnings;

my @names = ("Bart", "Lisa", "Maggie", "Homer");

#Sorts the array by the last letter of each string in reverse order:
my @sorted_names = sort {
    (substr($a, -1) cmp substr($b, -1))   # Compare last letter in reverse order
} @names;

#Prints the sorted array:
print "Sorted names:\n";
print join(", ", @sorted_names) . "\n";
