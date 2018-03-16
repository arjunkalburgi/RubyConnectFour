require_relative './contracts'
require_relative '../player'


class AIOpponent < Player
    extend AIOpponentContracts

    @difficulty 

    def initialize(colour, diff) 
        @difficulty = diff
        super(colour)
    end

    def make_move(game_board)
        random_move(game_board)
    end

    private 

end 