#!/usr/bin/env ruby
# frozen_string_literal: true

require 'set'

input_fname = ARGV[0] || 'input.txt'
input = File.open(input_fname, 'r')

accum = Set.new

input.each_line do |line|
  entry = line.chomp.to_i
  expect = 2020 - entry

  if accum.include?(expect)
    puts entry * expect
    exit 0
  end

  accum << entry
end
