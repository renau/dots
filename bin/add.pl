#!/usr/bin/perl

my $total=0;
my $lines=1;

while(<STDIN>){
  $total+=$_;
  $lines++;
}

print "Total: " . $total . " Avg " . ($total/$lines) . "\n";
