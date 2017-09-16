#!/usr/bin/env ruby

class Isbn
    def initialize(input)
        @match = /^
                (?<group>       \d{1,5}     )
                (?<separator>   [-\ ,]      )
                (?<publisher>   \d{1,7}     )
                \k<separator>   # same separator
                (?<edition>     \d{1,6}     )
                \k<separator>?  # same separator, optionally
                (?<checkdigit>  \d | \? | X )
        $/x =~ input

        # these three vars are strings
        @group = group
        @publisher = publisher
        @edition = edition

        # digits is an array of integers
        @digits = [group, publisher, edition].join.chars.map{ |d| d.to_i }
        
        if checkdigit == '?'
            # here's kindof a functional approach to calculating the check digit
            @digits << @digits.map.with_index{ |d,i| d*(i+1) }.reduce(:+) % 11
        elsif checkdigit == 'X'
            @digits << 10
        else
            @digits << checkdigit.to_i
        end
    end

    def valid?
        return false unless @digits.length == 10

        # here's a straightforward imperative approach to calculating the check digit
        i = 0
        s = 0
        while i < 9 
            s += @digits[i] * (i+1)
            i += 1
        end
        checkdigit = s % 11

        return @digits.last == checkdigit
    end

    def to_s
        return '' unless self.valid?
        return [@group, @publisher, @edition, @digits.last == 10 ? 'X' : @digits.last.to_s ].join('-')
    end
end


puts Isbn.new('12-3456-789-X').to_s
puts Isbn.new('12-3456-789-?').to_s
puts Isbn.new('12-3456-000-X').to_s # invalid
puts Isbn.new('12-3456-000-?').to_s
