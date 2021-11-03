def palindrome?(str)

    str.each_char.with_index do |char, ind|
        if char != str[(-1 - ind)]
            return false
        end
    end
    return true
end

def substrings(str) # with while loop
    arr = []
    i = 0

    while i < str.length
        j = 0
        
        while j < str.length
            if j >= i and !arr.include?(str[i..j])
                arr << str[i..j]               
            end
            j += 1
        end
        i += 1
    end
    arr
end

# or

# def substrings(str) # with each loop
#     arr = []
#     i = 0

#     (i...str.length).each do
#         j = 0
        
#         (j...str.length).each do
#             if j >= i and !arr.include?(str[i..j])
#                 p i, j
#                 arr << str[i..j]
                
#             end
#             j += 1
#         end
#         i += 1
#     end
#     arr
# end

def palindrome_substrings(str)
    arr = []

    substrings(str).each do |elem|
        if elem.length > 1 and palindrome?(elem)
            arr << elem
        end
    end
    arr
end