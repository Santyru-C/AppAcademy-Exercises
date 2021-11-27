# Write a method, pow(base, exponent), that takes in two numbers.
# The method should calculate the base raised to the exponent power.
# You can assume the exponent is always positive.
def pow(base, exponent)
    return 1 if exponent == 0
    base * pow(base, exponent - 1)
end


# Write a method, lucas_number(n), that takes in a number.
# The method should return the n-th number of the Lucas Sequence.
def lucas_number(n)
    return 1 if n == 1
    return 2 if n == 0

    lucas_number(n-1) + lucas_number(n-2)
end


# Write a method, sum_array(array), that takes in an array of numbers.
# The method should return the total sum of the elements.
def sum_array(array)
    return 0 if array.empty?
    array[0] + sum_array(array[1..-1])

end


# Write a method, reverse_string(str), that takes in a string.
# The method should return the string with it's characters in reverse order.
def reverse_string(str)
    return "" if str.empty?
    str[-1] + reverse_string(str[0...-1])
end




# Write a method, flatten(data), that accepts a single argument. The
# method should take in an array of any dimension and return the flattened
# version of that array. Solve this recursively.

def flatten(data)
    return [data] if !data.kind_of?(Array)
    
    flat_array = []
    data.each {|el| flat_array += flatten(el)} # this will keep calling the method and the loop inside of it until we reach a non array object
    flat_array
end