def average(num_1, num_2)
    (num_1+num_2)/2.0
end

def average_array(arr)
    arr.inject(0, :+) / arr.length.to_f
end

def repeat(str, num)
    str*num
end

def yell(str)
    str.upcase! + "!"
end

def alternating_case(str)
    arr = str.split(" ")

    arr.each_with_index do |ele, ind|
        if ind == 0 or ind % 2 == 0
            ele.upcase!
        else
            ele.downcase!
        end
    end
    arr.join(" ")
end
            