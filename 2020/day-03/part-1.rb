#!/usr/bin/env ruby

input_fname = ARGV[0] || 'input.txt'
input = File.open(input_fname, 'r')

position = 0

result = input.each_line.with_index.count do |line, idx|
  next false if idx == 0

  map_line = line.chomp
  position = position + 3

  map_line[position % map_line.size] == '#'
end

puts result
