

class Player
    attr_reader :player_name, :player_win_string, :player_piece_character

    def initialize(name, win_string, piece_char)
        invariant 
        pre_init(win_string, piece_char)

        @player_name = name
        @player_win_string = win_string
        @player_piece_character = piece_char

        post_init
        invariant         
    end

end