require_relative './gui_contracts'

class Gui 
    include GuiContracts
    attr_reader :get_game_dimensions, :get_game_players, :start_game, :wait_for_computer, :exit_from_error, :quit

    def get_game_dimensions 
        invariant 
        pre_get_game_dimensions

        post_get_game_dimensions
        invariant
    end

    def get_game_players
        invariant 
        pre_get_game_players

        post_get_game_players
        invariant
    end

    def start_game 
        invariant 
        pre_start_game

        post_start_game
        invariant
    end

    def request_player_move(current_player)
        invariant 
        pre_request_player_move

        post_request_player_move
        invariant
    end

    def wait_for_computer
        invariant 
        pre_wait_for_computer

        post_wait_for_computer
        invariant
    end

    def update_board(b)
        invariant 
        pre_update_board

        post_update_board
        invariant
    end

    def show_winner(player, board, winning_set)
        invariant 
        pre_show_winner

        post_show_winner
        invariant
    end

    def request_player_move_again(player)
        invariant 
        pre_request_player_move_again

        post_request_player_move_again
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