def all_words_capitalized?(arr)
    arr.all? {|word| word == word.capitalize}
end

def no_valid_url?(arr)
    valid = [".com", ".net", ".io", ".org"]
    arr.none? {|url| url.end_with?(".com", ".net", ".io", ".org")}
end

def any_passing_students?(arr)
    
    arr.any? {|h| (h[:grades].sum/h[:grades].size) >= 75}

    # or... maybe it seems cleaner this way
    # arr.any? do |h|
    #     grades = h[:grades]
    #     average = (grades.sum/grades.size)
    #     average >= 75
    # end 
end