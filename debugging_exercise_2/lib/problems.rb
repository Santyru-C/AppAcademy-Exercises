# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    (num).downto(1).each do |div|
        if num % div == 0 and prime?(div)
            return div
        end
    end
end

def prime?(num)
    (2...num).each do |n|
        if num % n == 0
            return false
        end
    end
    true
end

def unique_chars?(str)
    hash = Hash.new(0)

    str.each_char do |c|
        hash[c] += 1
    end

    return true if hash.values.all? {|v| v == 1}
    false
end

def dupe_indices(arr)
    hash = Hash.new {|h, k| h[k] = []}

    arr.each_with_index do |e, i|
        hash[e] << i
    end

    dupes = hash.keep_if {|k, v| v.length > 1}
    dupes
end

def ana_array(arr_1, arr_2)

    if arr_1.length != arr_2.length
        return false
    end
    
    arr_1.each do |ele|
        if !arr_2.include?(ele)
            return false
        else
            ind = arr_2.index(ele)
            arr_2.delete_at(ind)
        end
    end
    
    true
end
