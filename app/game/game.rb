require_relative './game_contracts'

require_relative './ai/ai'
require_relative './board/board'
require_relative './player'


class Game 
    extend GameContracts


    def initialize
        setup_game
        setup_board 
    end

    def make_move(player, column)
        player.make_move(@board, column)
    end

    private 

    def setup_game
    end 

    def setup_board 
    end 

    def takedown_board
    end

    def check_game
    end

end 