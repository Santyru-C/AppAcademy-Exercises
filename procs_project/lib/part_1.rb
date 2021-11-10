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
    new_arr = [] 
end