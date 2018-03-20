require_relative './gui_contracts'

class GUI 
    include GUIContracts
   
	
    def get_game_dimensions 
        return @dimensions
    end

    def initialize(dimensions, token_choices)
        pre_initialize(dimensions, token_choices)
		@dimensions = dimensions
		@token_choices = token_choices

        post_initialize
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
	
	def display_error_message(message)
		invariant
		pre_display_error_message
		
		post_display_error_message
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