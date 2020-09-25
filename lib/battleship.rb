require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = length * length / 2
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            true
        else
            false
        end
    end

    def win?
        if @board.num_ships == 0
            p "you win"
            true
        else
            false
        end
    end

    def game_over?
        if win? || lose?
            true
        else
            false
        end
    end

    def turn
        move = @player.get_move
        if !@board.attack(move)
            @remaining_misses -= 1
        end
        @board.print  
        p @remaining_misses
    end

end
