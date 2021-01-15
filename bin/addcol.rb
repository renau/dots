#!/usr/bin/ruby -w

if ARGV.empty?
  puts "Usage:\n\t#{$0} currenttable"
  exit(-2)
end

dstf = File.open(ARGV[0])
srcf = STDIN

while true
  src_line = srcf.gets
  dst_line = dstf.gets
  break if !src_line 
  break if !dst_line 

  puts dst_line.chop + " " + src_line
end

