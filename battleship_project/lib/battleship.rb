require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(board_length)
        @board = Board.new(board_length)
        @player = Player.new()
        @remaining_misses = @board.size * 0.5
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships > 0
            return false
            puts "you win"
            return true
        else
            puts "you win"
            return true
        end
    end

    def game_over?
        return true if self.win? or self.lose?
        false
    end

    def turn
        attack = @board.attack(@player.get_move)
        @board.print
        @remaining_misses -= 1 if !attack
        puts @remaining_misses
    end

end
