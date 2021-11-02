ALPHABET = "abcdefghijklmnopqrstuvwxyz"

def caesar_cipher(str, num)

    str.each_char.with_index do |char, ind|
        if ALPHABET.include?(char)
            char_pos = ALPHABET.index(char)
            str[ind] = ALPHABET[char_pos + num]
        end
    end
    str
end

 p caesar_cipher("hola", 3)