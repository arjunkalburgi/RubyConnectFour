

class Player

    def initialize(colour)

        @piece_colour = colour #"red" | "yellow" | "orange" | "green" | "blue" | "purple" | "white" | "teel" | "brown" | "lightblue"

    end

    def make_move(game_board, column)
        insert_piece(game_board, column)
    end

    private 

    def insert_piece(game_board, column)
    end

end