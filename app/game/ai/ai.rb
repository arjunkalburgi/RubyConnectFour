require_relative './contracts'


class AIOpponent 
    extend AIOpponentContracts

    @difficulty 

    def initialize(diff) 
        @difficulty = diff
    end

    def make_move(game_board)
        random_move(game_board)
    end

    private 

end 