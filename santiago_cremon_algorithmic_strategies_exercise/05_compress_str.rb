# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    compressed_str = ""
    
    i = 0
    while i < str.length # iterate over all the characters of the string
        char = str[i] # get the current character to check equality with the following character
        counter = 0

        while char == str[i]
            counter += 1 # keep a record of the times that the character repeats itself
            i += 1
        end
        
        if counter > 1
            compressed_str += (counter.to_s + char)
        else # this is made to avoid putting a 1 in front of non repeating characters
            compressed_str += char
        end
    end
    compressed_str
end
p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
