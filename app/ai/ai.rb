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

    def random_move(gb)
        r = rand(0..gb.row(0).size - 1)
        gb.col_full?(r) ? random_move(gb) : r
    end 

end 