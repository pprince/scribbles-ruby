#!/usr/bin/env ruby 

def check_isbn10(input)
    match = input.delete(' -').match(/^(\d{9})(\d|X)$/)
    return false unless match
    digits = match[1].chars.map{|c| c.to_i}
    checkdigit = case match[2]
        when 'X'
            10
        else
            match[2].to_i
        end
    return checkdigit == digits.map.with_index{ |d,i| d*(i+1) }.reduce(:+) % 11
end

def check_isbn13(input)
    input.delete!(' -')
    return false unless input.match(/^\d{13}$/)
    digits = input[0..11].chars.map{|c| c.to_i}
    checkdigit = input[12].to_i
    return checkdigit == (10 - (digits.map.with_index{ |d,i| (i%2==0) ? d : d*3 }.reduce(:+) % 10)) % 10
end

puts "Valid ISBN10's:"
puts check_isbn10('123456789X')
puts check_isbn10('01 234 567 89')
puts check_isbn10('0-471-958-697')
puts
puts "Invalid ISBN10's:"
puts check_isbn10('0123456780')
puts check_isbn10('0-471-958-698')
puts check_isbn10('123456789x')
puts
puts "Valid ISBN13's:"
puts check_isbn13('9780470059029')
puts check_isbn13('978-0-13-149505-0')
puts check_isbn13('978 0 471 48648 0')
puts
puts "Invalid ISBN13's:"
puts check_isbn13('9780470059020')
puts check_isbn13('978-0-13-149505-1')
puts check_isbn13('978_0_471_48648_0')

# OUTPUT
# ======
#
# Valid ISBN10's:
# true
# true
# true
# 
# Invalid ISBN10's:
# false
# false
# false
# 
# Valid ISBN13's:
# true
# true
# true
# 
# Invalid ISBN13's:
# false
# false
# false
