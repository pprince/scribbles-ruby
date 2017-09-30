module Isbn

    def Isbn.check_isbn10(input)
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

    def Isbn.check_isbn13(input)
        input.delete!(' -')
        return false unless input.match(/^\d{13}$/)
        digits = input[0..11].chars.map{|c| c.to_i}
        checkdigit = input[12].to_i
        return checkdigit == -1 * digits.map.with_index{ |d,i| (i%2==0) ? d : d*3 }.reduce(:+) % 10
    end

    def Isbn.valid?(input)
        return check_isbn10(input) || check_isbn13(input)
    end

end
