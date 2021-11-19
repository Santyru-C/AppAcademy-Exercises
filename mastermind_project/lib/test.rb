ARR = ["a","b","c","d"]
other_arr = []
other_arr << ARR.sample
puts other_arr[0].upcase!
puts ARR
puts other_arr