def palindrome?(str)

    str.each_char.with_index do |char, ind|
        p char
        p str[(-1*str.length) + ind]
        if char != str[(-1*str.length) + ind]
            return false
        end
    end
    return true
end

p palindrome?("nesuen")