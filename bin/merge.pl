#!/usr/bin/perl

use strict;
use Getopt::Long;

my $op_add=" ";

my $result = GetOptions("add=s",\$op_add);

( @ARGV > 0 ) or die("Use:merge.pl <file>+");

my @fdesc;

for(my $i=0; $i < @ARGV ; $i++ ) {
  open($fdesc[$i],"<" . $ARGV[$i]) or die("Could not open file [" . $ARGV[$i] . "]\n");
}

my $cnt=0;
while(readline($fdesc[$cnt])){
  chop();
  print $_;
  if( eof($fdesc[$cnt]) ) {
    close($fdesc[$cnt]);
    $fdesc[$cnt]=0;
  }

  my $i;
  for($i=0;$i<@ARGV;$i++) {
    $cnt++;
    if( $cnt >= @ARGV ) {
      print "\n";
      $cnt = 0;
    }
    if( $fdesc[$cnt] ) {
      last;
    }
  }
  if( $i >= @ARGV ) {
    exit(0);
  }
  if( $cnt > 0 ) {
    print $op_add;
  }
}
