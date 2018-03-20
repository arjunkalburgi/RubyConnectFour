require_relative './gui_contracts'

class GUI 
    include GUIContracts
    
    def get_game_dimensions 
        invariant 
        pre_get_game_dimensions

        post_get_game_dimensions
        invariant
    end
	
	def set_game_dimensions(dimensions)
	
	end

    def start_game(dimensions, token_choices)
        invariant 
        pre_start_game

        post_start_game
        invariant
    end

    def update_board(b)
        invariant 
        pre_update_board

        post_update_board
        invariant
    end

    def show_winner(player)
        invariant 
        pre_show_winner

        post_show_winner
        invariant
    end

    def exit_from_error 
        invariant 
        pre_exit_from_error

        post_exit_from_error
        invariant
    end

    def quit
        invariant 
        pre_quit

        post_quit
        invariant
    end

    private 




end