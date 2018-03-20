require_relative './board_contracts'
require_relative './board_components'

class Board 
    include BoardContracts
    attr_reader :game_board, :rows, :columns


    def initialize(rows, columns) 
        pre_init(rows, columns)

        @rows = rows
        @columns = columns
        @game_board = Array.new(@rows){Array.new(@columns, 0)}

        post_init
        invariant
    end

    def can_add_to_column?(column_number)
        invariant
        pre_can_add_to_column(column_number)

        # result = true

        post_can_add_to_column
        invariant
        return result
    end

    def available_columns
        # list of columns that can have a piece added to it 
        invariant
        pre_available_columns

        # result = 

        post_available_columns
        invariant
        return result
    end 

    def add_piece(token, column_number)
        invariant
        pre_add_piece(column_number)

        # result = return true or false

        post_add_piece(column_number, token)
        invariant
        return result
    end

    def is_full?
        invariant
        pre_is_full

        # result = true

        post_is_full
        invariant
        return result
    end

    def row(row_number)
        invariant
        pre_row(row_number)

        result = @game_board[row_number]

        post_row
        invariant
        return result
    end

    def col(column_number)
        invariant
        pre_col(column_number)

        # result = column_number

        post_col
        invariant
        return result
    end

    def [](row, column)
        invariant
        pre_brackets(row, column)

        result = @game_board[row][column]

        post_brackets
        invariant
        return result
    end

    def to_s
        invariant

        @game_board.to_s
        
        invariant
    end

    def print_board
        invariant
        pre_print_board

        line = ""
        @game_board.each { |e|
            line += "|" + e.join(" ") + "|\n"
        }

        post_print_board(line)
        invariant
        return line
    end 

    def clear_board 
        invariant
        pre_clear_board
        
        @game_board = Array.new(rows){Array.new(columns, 0)}

        post_clear_board
        invariant
    end

end 