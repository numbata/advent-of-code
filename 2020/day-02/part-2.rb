#!/usr/bin/env ruby

input_fname = ARGV[0] || 'input.txt'
input = File.open(input_fname, 'r')

result = input.each_line.count do |line|
  policy, password = line.split(': ')
  counts, char = policy.split(' ')
  first, second = counts.split('-').map(&:to_i)
  next false if password[first - 1] == password[second - 1]

  password[first - 1] == char ||  password[second - 1] == char
end

puts result
