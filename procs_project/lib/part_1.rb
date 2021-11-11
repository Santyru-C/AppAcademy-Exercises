def my_map(arr, &prc)
    new_arr = []
    arr.each {|el|  new_arr << prc.call(el)}
    new_arr
end

def my_select(arr, &block) #Work in progress
    new_arr = []
    arr.each do |el|
    
        if block.call(el)
            new_arr << el
        end
    end
    new_arr
end

def my_count(arr, &block)
    counter = 0
    arr.each {|el| counter += 1 if block.call(el)}
    counter
end

def my_any?(arr, &block)

    arr.each {|el| return true if block.call(el)}
    false
end

def my_all?(arr, &block)
    arr.each {|el| return false if !block.call(el)}
    true
end

def my_none?(arr, &block)
    arr.each {|el| return false if block.call(el)}
    true
end