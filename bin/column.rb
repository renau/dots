#!/bin/env ruby 

$ncols = 1
if ARGV.size() > 0
  $ncols = ARGV[0].to_i
  if $ncols <1 or $ncols > 10
    puts "ncols out of range 1..10 (#{$ncols})"
    exit -1
  end
end

conta = 0
while txt = STDIN.gets
  txt = txt.chop()
  next if txt.size() == 0
  next if txt[0] == '#'
  if conta >= $ncols
    puts
    conta = 0
  end
  conta = conta + 1
  print txt
end

puts

