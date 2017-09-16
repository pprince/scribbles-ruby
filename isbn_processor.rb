#!/usr/bin/env ruby

require_relative 'isbn'

# Validate command-line arguments
unless ARGV.length == 2 then
    cmd = File.basename($0)
    $stderr.puts <<~EOF
        #{cmd}: ERROR: wrong number of arguments (expected 2, got #{ARGV.length}.)

            Usage:  #{cmd} <input_file> <output_file>

            Example:  ./#{cmd} sampledata.txt OUT.csv

    EOF
    exit(1)
end


in_file = File.open(ARGV[0], 'r')
out_file = File.open(ARGV[1], 'w')

in_file.readlines.each do |line|
    next if line =~ /^\s*$/  # skip blank lines
    next if line =~ /^\s*#/  # skip comments

    col1 = line.chomp
    col2 = Isbn.valid?(col1) ? "valid" : "invalid"

    out_file.puts %Q("#{col1}","#{col2}")
end

in_file.close()
out_file.close()
