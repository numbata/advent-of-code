#!/usr/bin/env ruby

input_fname = ARGV[0] || 'input.txt'
input = File.open(input_fname, 'r')

STRICT_PASSPORT_FIELDS = %w[byr iyr eyr hgt hcl ecl pid]
result = 0

while !input.eof? do
  line = input.readline.chomp
  next if line.empty?

  # Build passport
  passport_fields = []
  while true do
    line.split(' ').each do |record|
      field, _ = record.split(':', 2)
      passport_fields << field
    end
    break if input.eof?

    line = input.readline.chomp
    break if line.empty?
  end

  # Validate passport
  result +=1 if (STRICT_PASSPORT_FIELDS - passport_fields).empty?
end

puts result
