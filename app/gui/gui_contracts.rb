module GUIContracts

    def invariant 
        # do nothing 
        
    end 


    
    def pre_get_game_dimensions
        # no pre conditions
    end

    def post_get_game_dimensions
        # no post conditions
    end 


    
    def pre_start_game(dimensions, token_choices)
        raise "Invalid dimensions" unless dimensions[0] > 0 && dimensions[1] > 0
		# TODO: check if token_choices contain valid file paths for image representations?
		
    end

    def post_start_game
        # no post conditions
    end 
    
    def pre_update_board
        # TODO: check that file paths are still valid for token image assets?
    end

    def post_update_board
        # no post conditions
    end 


    
    def pre_show_winner
        # no pre conditions
    end

    def post_show_winner
        # no post conditions
    end 


    
    def pre_exit_from_error
        # no pre conditions
    end

    def post_exit_from_error
        # no post conditions
    end 


    
    def pre_quit
        # no pre conditions
    end

    def post_quit
        # no post conditions
    end 

end