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
    vowels = "aeiou"
    v_to_arrange = []
    idx = 0
    # kinda missed the point in this method, must re do
    # str.each_char do |c|
    #     if vowels.include?(c)
    #         o_idx = vowels.index(c)
    #         n_idx = (o_idx - 1) % 5
    #         new_str += vowels[n_idx]
    #     else
    #         new_str += c
    #     end
    # end
    # new_str
    
    str.each_char {|c| v_to_arrange << c if vowels.include?(c)}
    v_rotated = v_to_arrange.unshift(v_to_arrange.pop)

    str.each_char.with_index do |c, i|
        if vowels.include?(c)
            str[i] = v_rotated[idx]
            idx += 1
        end
    end
    str


end

# Examples
# puts vowel_rotate('computer')      # => "cempotur"
# puts vowel_rotate('oranges')       # => "erongas"
# puts vowel_rotate('headphones')    # => "heedphanos"
# puts vowel_rotate('bootcamp')      # => "baotcomp"
# puts vowel_rotate('awesome')       # => "ewasemo"

# Proc problems

class String
    def select(&prc)
        new_str = ""
        if !prc
            return new_str
        else
            self.each_char do |c|
                new_str << c if prc.call(c)
            end
            return new_str
        end
    end

    def map!(&prc)
        self.each_char.with_index do |c, i|
            self[i] = prc.call(c, i)
        end
    end
end

# # Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

# Recursion problems

def multiply(a, b)
    return 0 if a == 0 or b == 0

    if b >= 0
        a + multiply(a, b - 1)
    else
        -(a + multiply(a, -b - 1))
    end
end

# Examples
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(length)
    return [] if length == 0
    return [2] if length == 1
    return [2, 1] if length == 2

    seq = lucas_sequence(length - 1)
    next_el = seq[-1] + seq[-2]
    seq << next_el
    seq
end

# Examples
# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    (2...num).each do |fact|
        if num % fact == 0
            other_fact = num / fact
            return [*prime_factorization(fact), *prime_factorization(other_fact)]
        end
    end
    [ num ]
end

# Examples
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]