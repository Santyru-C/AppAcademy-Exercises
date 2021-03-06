# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num1, num2)
    
    d1 = find_divisors(num1)
    d2 = find_divisors(num2)

    d1.each do |d|

        if d == 1 
            next
        elsif d2.include?(d)
            return false
        end
    end
    return true
end

def find_divisors(num)
    divisors = []

    (1..num).each do |n|
        
        if num % n == 0
            divisors << n
        end

    end

    return divisors
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
