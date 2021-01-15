#!/bin/env ruby

#conta = 0
while txt = STDIN.gets
  txt.gsub!(/\s+/,' ')
#  puts "#{conta} #{txt}"
  puts txt
  conta = conta + 1
end

