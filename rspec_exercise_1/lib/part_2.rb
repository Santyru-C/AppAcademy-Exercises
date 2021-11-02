
def hipsterfy(str)
    arr = str.split("")
    vowels = "aeiou"
    i = arr.length - 1

    while i >= 0
        if vowels.include?(arr[i])
            arr[i] = ""
            return arr.join("")
        end
        i -= 1
    end

    arr.join("")
end

def vowel_counts(str)
    hash = Hash.new(0)
    str.downcase!

    str.each_char do |char|
        hash[char] += 1
    end
    hash
end

def caesar_cipher(str, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"

    str.each_char.with_index do |char, ind|
        if alphabet.include?(char)
            char_pos = alphabet.index(char)
            str[ind] = alphabet[(char_pos + num)%26]
        end
    end
    str
end