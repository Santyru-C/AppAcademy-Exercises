require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length.to_i)
    end

    def print_matches(guess)
        puts "Exact matches: " + @secret_code.num_exact_matches(guess).to_s
        puts "Near matches: " + @secret_code.num_near_matches(guess).to_s
    end

    def ask_user_for_guess
        puts "Enter a code"
        n_guess = Code.from_string(gets.chomp)

        print_matches(n_guess)
        @secret_code == n_guess
    end
end
