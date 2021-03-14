#!/usr/bin/env ruby

input_fname = ARGV[0] || 'input.txt'
input = File.open(input_fname, 'r')

slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
slopes_result = Array.new(slopes.count, 0)

input.each_line.with_index do |line, line_idx|
  map_line = line.chomp

  slopes.each_with_index do |(xd, yd), idx|
    next if (line_idx) % yd != 0

    step = line_idx / yd
    position = (step * xd) % map_line.size
    slopes_result[idx] += 1 if map_line[position] == '#'
  end
end

puts slopes_result.inject(:*)
