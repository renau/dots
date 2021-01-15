#!/usr/bin/ruby -i

rwd = Dir.getwd.sub(ENV['HOME'],'~')

if rwd.length > 80
  rwd = ".." + rwd[-78..-1]
end

if Process.uid == 0
  ps1 = rwd + "#\n "
else
  ps1 = rwd + "$\n "
end

printf ps1

