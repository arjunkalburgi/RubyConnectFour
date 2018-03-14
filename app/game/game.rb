require_relative './game_contracts'

require_relative './ai/ai'
require_relative './board/board'


class Game 
    extend GameContracts


    def initialize
        setup_game
        setup_board 
    end

    def user_move
    end

    def ai_move
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