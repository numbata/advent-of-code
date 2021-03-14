#!/usr/bin/env ruby

require 'set'

input_fname = ARGV[0] || 'input-01.txt'
input = File.open(input_fname, 'r')

accum = input.each_line.map { |line| line.chomp.to_i }

entry = accum.combination(3).find { |combi| combi.sum == 2020 }
puts entry.inject(:*)
