def select_even_nums(num_array)
    num_array.select(&:even?)
end

def reject_puppies(arr)
    arr.reject {|h| h["age"] <= 2}
end

def count_positive_subarrays(arr)
    arr.count {|s_arr| s_arr.sum > 0}
end

def aba_translate(str)
    vowels = "aeiou"
    new_s = ""
    str.each_char.with_index do |c, i|
        if vowels.include?(c)
            new_s += c + "b" + c
        else
            new_s += c
        end
    end
    new_s
end

def aba_array(arr) # Work in progress
    arr.map {|e| aba_translate(e)}
end