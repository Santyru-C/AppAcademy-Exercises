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

def char_indices(str)
    c_idx = Hash.new {Array.new}
    str.each_char.with_index do |char, idx| 
        c_idx[char] << idx 
        print c_idx[char]
    end
end

# Examples
char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}