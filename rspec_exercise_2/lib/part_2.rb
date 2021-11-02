def palindrome?(str)

    str.each_char.with_index do |char, ind|
        if char != str[str.length - ind]
            return false
        end
    end
    return true
end