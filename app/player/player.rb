

class Player
    attr_reader :player_name, :player_win_condition, :tokens

    def initialize(name, win_condition)
        invariant 
        pre_init(win_condition)

        @player_name = name
        @player_win_condition = win_condition

        @tokens = win_condition.uniq

        post_init
        invariant
    end

end