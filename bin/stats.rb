#!/usr/bin/ruby -w

#  Add methods to Enumerable, which makes them available to Array
module Enumerable
 
  #  sum of an array of numbers
  def sum
    return self.inject(0){|acc,i|acc + i}
  end
 
  #  average of an array of numbers
  def average
    return self.sum/self.length.to_f
  end
 
  #  variance of an array of numbers
  def sample_variance
    avg=self.average
    sum=self.inject(0){|acc,i|acc + (i-avg)**2}
    return(1/self.length.to_f*sum)
  end
 
  #  standard deviation of an array of numbers
  def standard_deviation
    return Math.sqrt(self.sample_variance)
  end
 
end  #  module Enumerable

data= Array.new
udata= Array.new
while line = gets
  data << line.to_f
  udata << line.to_f.abs
end

puts "size:" + data.size.to_s
puts "sum: " + data.sum.to_s
puts "min: " + data.min.to_s
puts "max: " + data.max.to_s
puts "avg: " + data.average.to_s
puts "var: " + data.sample_variance.to_s
puts "sd:  " + data.standard_deviation.to_s

puts "uavg: " + udata.average.to_s
