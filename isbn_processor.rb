#!/usr/bin/env ruby

require_relative 'isbn'

puts "Valid ISBN10's:"
puts Isbn.check_isbn('123456789X')
puts Isbn.check_isbn('01 234 567 89')
puts Isbn.check_isbn('0-471-958-697')
puts
puts "Invalid ISBN10's:"
puts Isbn.check_isbn('0123456780')
puts Isbn.check_isbn('0-471-958-698')
puts Isbn.check_isbn('123456789x')
puts
puts "Valid ISBN13's:"
puts Isbn.check_isbn('9780470059029')
puts Isbn.check_isbn('978-0-13-149505-0')
puts Isbn.check_isbn('978 0 471 48648 0')
puts
puts "Invalid ISBN13's:"
puts Isbn.check_isbn('9780470059020')
puts Isbn.check_isbn('978-0-13-149505-1')
puts Isbn.check_isbn('978_0_471_48648_0')
