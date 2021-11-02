def partition(arr, num)
    part = Array.new(2) {Array.new}

    arr.each_with_index do |ele, ind|
        if ele < num
            part[0] << arr[ind]
        else
            part[1] << arr[ind]
        end
    end
    part
end

def merge(hash_1, hash_2)
    hash_3 = {}

    hash_2.each do |k, v|
        hash_3[k] = v
    end

    hash_1.each do |k, v|
        if hash_3.has_key?(k)
            next
        else
            hash_3[k] = v
        end
    end
    hash_3
end

def censor(str, bad_words)
    vowels = "aeiou"
    split_sent = str.split(" ")

    split_sent.each do |word|
        
        if bad_words.include?(word.downcase)
            word.each_char.with_index do |char, ind|
                
                if vowels.include?(char.downcase)
                    word[ind] = "*"
                end
            end
        end
    end
    split_sent.join(" ")
end

def power_of_two?(num)
    log_2 = Math.log(num, 2)

    return true if num >= 1 and log_2 % 1 == 0
    false
end