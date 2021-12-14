class Array
    def my_each(&prc)
       self.each {|element| prc.call(element)}
    end



    def my_select(&prc)
        selection = []
        
        self.my_each {|element| selection << element if prc.call(element)}
        selection
    end

    def my_reject(&prc)
        not_rejected = []

        self.my_each{|element| not_rejected << element if !prc.call(element)}
        not_rejected
    end

    def my_any?(&prc)
        self.my_each{|element| return true if prc.call(element)}
        false
    end

    def my_all?(&prc)
        self.my_each{|element| return false if !prc.call(element)}
        true
    end
end

a = [1, 2, 3]
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

# test