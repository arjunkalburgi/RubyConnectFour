
module PlayerContracts
    def invariant 
        raise "The Player object is not correct" unless !@player_name.nil? or !@player_win_condition.nil? or !@tokens.nil? 
        raise "The Player object win_condition is not correct" unless @player_win_condition.is_a? Array and @player_win_condition.size > 1
        raise "The Player tokens array is not correct" unless @tokens.is_a? Array and @tokens.size > 0
    end 


    def pre_init(w)
        raise "The Player object win_condition is not correct" unless w.is_a? Array and w.size > 1
    end 

    def post_init
        # nothing to do here
    end 


    def pre_make_move
        # nothing to do here
    end 

    def post_make_move
        # nothing to do here
    end 


end 