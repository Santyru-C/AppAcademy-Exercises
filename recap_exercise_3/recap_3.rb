require "prime"
#General problems

def no_dupes?(arr)
    no_duplicates = []

    arr.each do |ele|
        no_duplicates << ele if !(arr.count(ele) > 1)
    end
    print no_duplicates
end

# no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.size - 1).each do |i|
        return false if arr[i] == arr[i + 1]
    end
    true
end

# Examples
# puts no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# puts no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# puts no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# puts no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# puts no_consecutive_repeats?(['x'])                              # => true

# def char_indices(str)
#     c_idx = Hash.new {Array.new}
#     str.each_char.with_index do |char, idx| 
#         c_idx[char] << idx 
#         print c_idx[char]
#     end
# end

# # Examples
# char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    letter = ""
    max_streak = 0
    counter = 1

    str.each_char.with_index do |c, i|
        if c == str[i + 1]
            counter += 1 
        else
            counter = 1
        end

        if counter >= max_streak
            letter = c
            max_streak = counter
        end
    end

    letter * max_streak        
end

# Examples
# puts longest_streak('a')           # => 'a'
# puts longest_streak('accccbbb')    # => 'cccc'
# puts longest_streak('aaaxyyyyyzz') # => 'yyyyy
# puts longest_streak('aaabbb')      # => 'bbb'
# puts longest_streak('abc')         # => 'c'

def bi_prime?(num)
    prime_divisors = []

    (2...num).each {|div| prime_divisors << div if num % div == 0 and div.prime?}
    
    (0...prime_divisors.size).each do |i|
        (i...prime_divisors.size).each do |j|
            return true if prime_divisors[i] * prime_divisors[j] == num
        end
    end
    false    
end

# # Examples
# puts bi_prime?(14)   # => true
# puts bi_prime?(22)   # => true
# puts bi_prime?(25)   # => true
# puts bi_prime?(94)   # => true
# puts bi_prime?(24)   # => false
# puts bi_prime?(64)   # => false

def cipher(letter, num)
    alph = ("a".."z").to_a
    old_index = alph.index(letter)
    new_index = (old_index + num) % 26
    ciphered = alph[new_index]
end

def vigenere_cipher(message, keys)
    v_ciphered = ""

    (0...message.length).each do |i|
        key_index = i % keys.size
        letter = message[i]
        key = keys[key_index]
        v_ciphered += cipher(letter, key)
    end
    v_ciphered
end

# Examples
# puts vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# puts vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# puts vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# puts vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# puts vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    # kinda missed the point in this method, must re do
    vowels = "aeiou"
    new_str = ""

    str.each_char do |c|
        if vowels.include?(c)
            o_idx = vowels.index(c)
            n_idx = (o_idx - 1) % 5
            new_str += vowels[n_idx]
        else
            new_str += c
        end
    end
    new_str
end

# Examples
puts vowel_rotate('computer')      # => "cempotur"
puts vowel_rotate('oranges')       # => "erongas"
puts vowel_rotate('headphones')    # => "heedphanos"
puts vowel_rotate('bootcamp')      # => "baotcomp"
puts vowel_rotate('awesome')       # => "ewasemo"