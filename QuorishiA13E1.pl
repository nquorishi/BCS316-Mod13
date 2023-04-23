#NQ-BCS316
#Exercise 1 - Use the file from exercise 12.3 and display the data sorted 
#and formatted with the version in one column and the module name in a 2nd column.
use 5.23.0;
use strict;
use warnings;
use Digest::MD5;

my $password;

#Prompts user to enter password twice:
do {
    print "Enter password: ";
    $password = <STDIN>;
    chomp $password;
    print "Confirm password: ";
    my $confirm_password = <STDIN>;
    chomp $confirm_password;

    if ($password ne $confirm_password) {
        print "Passwords do not match. Please try again.\n";
        $password = undef;
    }
} until defined $password;

#Creates hash of password and store in file:
my $hash = Digest::MD5::md5_hex($password);
open my $fh, '>', 'password_hash.txt' or die "Could not open file: $!";
print $fh $hash;
close $fh;

#Prompts user to enter password and compare with stored hash:
print "Enter password to verify: ";
my $verify_password = <STDIN>;
chomp $verify_password;
my $verify_hash = Digest::MD5::md5_hex($verify_password);

open my $fh2, '<', 'password_hash.txt' or die "Could not open file: $!";
my $stored_hash = <$fh2>;
chomp $stored_hash;
close $fh2;

if ($verify_hash eq $stored_hash) {
    print "Password is correct!\n";

    #Displays the Perl modules and their versions bundled with Perl version 5.023:
    use Module::CoreList;

    my %modules = %{$Module::CoreList::version{5.023}};
    my @module_names = sort keys %modules;

    print "Module Name\tVersion\n";
    print "-----------\t-------\n";

    foreach my $module (@module_names) {
        printf("%-20s%s\n", $module, $modules{$module});
    }
} else {
    print "Password is incorrect.\n";
}
