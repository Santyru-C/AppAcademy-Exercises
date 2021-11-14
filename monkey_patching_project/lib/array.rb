# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.all?(Numeric)
            return nil if self.size == 0
            self.max - self.min
        end
    end

    def average
        average = self.sum / (self.size).to_f
        return nil if self.size == 0
        return average if self.all?(Numeric)
    end

    def median
        sorted = self.sort
        mid = self.size / 2

        return nil if self.size == 0

        if self.size % 2 != 0
            return sorted[mid]
        else
            (sorted[mid] + sorted[mid - 1]) / 2.0
        end
    end

    def counts
        h = Hash.new(0)
        self.each {|e| h[e] += 1}
        h
    end

    def my_count(element)
        counter = 0
        self.each {|e| counter += 1 if e == element}
        counter
    end
    
    def my_index(val)
        return nil if !self.include?(val)
        self.each_with_index {|e, i| return i if e == val}
    end

    def my_uniq
        n_arr = []

        self.each {|e| n_arr << e if !n_arr.include?(e)}
        n_arr
    end

    def my_transpose
        transposed_array = Array.new(self.size) {Array.new}

        self.each do |row| # I know that I can nest all the loop in a single line but it is easier to read this way
            row.each_with_index {|e, i| transposed_array[i] << e}
        end
        
        transposed_array
    end
end