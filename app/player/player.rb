

class Player
    attr_reader :player_name, :player_win_condition, :player_piece_character

    def initialize(name, win_condition, piece_char)
        invariant 
        pre_init(win_condition, piece_char)

        @player_name = name
        @player_win_condition = win_condition
        @player_piece_character = piece_char

        post_init
        invariant
    end

end