require_relative './board_contracts'

class Board 
    include BoardContracts
    include Enumerable
    attr_reader :game_board, :rows, :columns


    def initialize(rows, columns) 
        pre_init(rows, columns)

        @rows = rows
        @columns = columns
        @game_board = Array.new(@rows){Array.new(@columns)}

        post_init
        invariant
    end

    def can_add_to_column?(column_number)
        invariant
        pre_can_add_to_column(column_number)

        result = false
        if !@game_board[0][column_number]
            result = true
        end

        post_can_add_to_column
        invariant
        return result
    end

    def available_columns
        # list of columns that can have a piece added to it 
        invariant
        pre_available_columns

        result = []
        i = 0
        while i < @columns do 
            if !@game_board[0][i]
                result << i
            end
        end 

        post_available_columns
        invariant
        return result
    end 

    def add_piece(token, column_number)
        invariant
        pre_add_piece(column_number)

        (0..@rows).each{ |row_index|
            if @game_board[@rows - row_index - 1][column_number] == nil
                @game_board[@rows - row_index - 1][column_number] = token
                break
            end
        }

        post_add_piece(column_number, token)
        invariant
        return result
    end

    def is_full?
        invariant
        pre_is_full

        result = true
        self.each { |e|
            if !e
                result = false
                break
            end
        }

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

        # result = @game_board.flatten.select.with_index{|v,i| i % @columns == column_number}
        result = Array.new(row_size)
        (0...@rows).each{|row_index| result[row_index] = self[row_index,i] }

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
            e.each {|token|
                if !token
                    token = "-"
                end
                line += element + " "
            }
            line += "\n"
        }

        post_print_board(line)
        invariant
        return line
    end 

    def clear_board 
        invariant
        pre_clear_board
        
        @game_board = Array.new(@rows){Array.new(@columns)}

        post_clear_board
        invariant
    end

    def each
        invariant
        pre_each
        (0...@rows).each{ |row_index|
            (0...@columns).each {|column_index|
                result = self[row_index, column_index]
                post_each
                invariant
                yield result
            }
        }
    end

    def each_with_index
        invariant
        pre_each_with_index
        (0...@rows).each{ |row_index|
            (0...@columns).each {|column_index|
                result = self[row_index, column_index]
                post_each_with_index(row_index, column_index)
                invariant
                yield result, row_index, column_index
            } 
        }
    end

end 