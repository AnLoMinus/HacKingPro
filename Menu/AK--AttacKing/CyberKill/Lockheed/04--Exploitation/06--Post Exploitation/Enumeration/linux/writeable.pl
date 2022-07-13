#!/usr/bin/perl
# Check files logged in user have write access to. 
# writeable.pl <directory>

use strict;

sub recurse {
  my $path = shift;
  my @files = glob "$path/{*,.*}";
  for my $file (@files) {
    if (-d $file) {
      if ($file !~ /\/\.$/ && $file !~ /\/\.\.$/) {
        recurse($file);
      }
    } else {
      print "$file\n" if -w $file;
    }
  }
}

print "Writable files for " . getlogin() . "\n";
recurse($ARGV[0]);
