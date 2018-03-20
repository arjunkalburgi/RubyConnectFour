require_relative './player_contracts'
require_relative './player'


class AIOpponent < Player
    extend PlayerContracts

    attr_reader :difficulty 

    def initialize(name, win_condition, tokens, diff) 
        invariant 
        pre_init

        @difficulty = diff
        super(name, win_condition, tokens)

        post_init
        invariant         
    end

    def make_move(game_board)
        invariant 
        pre_make_move

        # returns a column 

        post_make_move
        invariant         
    end

end 