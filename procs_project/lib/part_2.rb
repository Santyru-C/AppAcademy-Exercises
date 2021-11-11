def reverser(str, &block)
    n_str = ""
    str.each_char {|c| n_str.prepend(c)}
    block.call(n_str)
end

def word_changer(str, &block)
    words = str.split(" ")
    words.each_with_index {|w, i| words[i] = block.call(w)}
    words.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    a = prc1.call(num)
    b = prc2.call(num)
    # I'll be using the ternary operator for the sake
    # of simpler code
    max = a > b ? a : b
end

def and_selector(arr, prc1, prc2)
    n_arr = []
    arr.each {|el| n_arr << el if prc1.call(el) and prc2.call(el)}
    n_arr
end

def alternating_mapper(arr, prc1)
    # work in progress
end