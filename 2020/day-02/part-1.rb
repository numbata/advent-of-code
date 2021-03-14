#!/usr/bin/env ruby

input_fname = ARGV[0] || 'input.txt'
input = File.open(input_fname, 'r')

result = input.each_line.count do |line|
  policy, password = line.split(': ')
  counts, char = policy.split(' ')
  min, max = counts.split('-').map(&:to_i)

  (min..max).cover?(password.chomp.count(char))
end

puts result
