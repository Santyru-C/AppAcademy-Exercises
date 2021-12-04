# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    # to get the least common multiple we just need to divide the product of num_1 and num_2 by their gcd
    product = num_1 * num_2
    product / num_1.gcd(num_2) # thanks to the gdc built-in method
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigrams = []
    most_frequent = ""
    rep_times = 0

    (0...str.length - 1).each do |i| # str.length - 1 to avoid reaching a non existing index in the following line
        bigrams << str[i] + str[i+1]
    end
    
    bigrams.each do |bigram|
        n = bigrams.count(bigram)
        if n > rep_times
            most_frequent = bigram
            rep_times = n
        end
    end
    most_frequent
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        swapped_hash = {}
        self.each {|k, v| swapped_hash[v] = k}
        swapped_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        (0...self.size).each do |i|
            (i...self.size).each do |j|
                count += 1 if self[i] + self[j] == num
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new {|a, b| a <=> b}

        sorted = false

        while !sorted
            sorted = true
            (0...self.size - 1).each do |i|
                current_n = self[i]
                next_n = self[i + 1]
                if prc.call(current_n, next_n) == 1
                    sorted = false
                    current_n, next_n = next_n, current_n
                end
            end
        end
        self
    end
end
