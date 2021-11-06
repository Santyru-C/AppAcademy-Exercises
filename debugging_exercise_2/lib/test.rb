
def dupe_indices(arr)
    hash = Hash.new {|h, k| h[k] = []}

    arr.each_with_index do |e, i|
        hash[e] << i
    end
    p hash
end

h = dupe_indices(["a", "b", "b", "c", "c"])
p h