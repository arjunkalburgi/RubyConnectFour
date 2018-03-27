require_relative './game_contracts'
require_relative './game_error'

require_relative '../board/board'
require_relative '../player/player'
require_relative '../player/ai'


class Game 
    include GameContracts
    attr_reader :players, :board, :current_player_num

    def initialize(rows=nil, columns=nil, players=nil)
        pre_init(rows, columns, players)

        @observers = []
        set_game_dimensions(rows, columns)
        set_game_players(players)

        post_init
        invariant
    end

    def print_state 
        curr_player = @players[@current_player_num]
        @players.each { |p| 
            if p == curr_player
                puts "The current player: "
            end 
            puts p
        }

        puts @board.print_board
    end 


    def get_current_player
        invariant 
        pre_get_current_player
        
        player = @players[@current_player_num]
        
        post_get_current_player
        invariant 

        player
    end

    def reset_current_player(player)
        index = @players.rindex(player)

        @current_player_num = index
    end 

    def play_move(column=nil,token=nil)
        invariant 
        pre_play_move(column)
        beforeboard = @board.dup

        if @players[@current_player_num].is_a? AIOpponent
            column = @players[@current_player_num].choose_column(@board, @players, @current_player_num)
        end

        ##########THIS MAY NOT WORK
        if token == nil
            token = @players[@current_player_num].tokens[0]
        end
        row = @board.add_piece(column, token)
        ##########

        check_game(@players[@current_player_num])

        @observers.each{|o| o.update_value(column,row,token)}

        increment_player        

        post_play_move(beforeboard)
        invariant 

        return row
    end

    def add_observer(view)
        @observers << view
    end

    private

    def check_game(current_player)
        invariant
        pre_check_game

        combinations = @board.get_all_combinations_of_length(current_player.player_win_condition.length)
        @players.each { |p|
            if combinations.include? p.player_win_condition
                raise GameWon.new(p)
            elsif @board.is_full?
                raise GameEnd.new
            end
        }

        post_check_game
        invariant
    end

    def increment_player
        invariant 
        old_num = pre_increment_player

        @current_player_num += 1 
        if @current_player_num >= @players.size
            @current_player_num = 0
        end

        post_increment_player(old_num)
        invariant 
    end

    def set_game_dimensions(rows, columns)
        invariant 
        pre_set_game_dimensions

        if rows.nil? && columns.nil?
            @board = Board.new(6,7)
        else 
            @board = Board.new(rows,columns)
        end

        post_set_game_dimensions 
        invariant 
    end

    def set_game_players(players)
        invariant 
        pre_set_game_players

        if players.nil? 
            p1 = Player.new("Player1", ["R", "R", "R", "R"]) 
            p2 = AIOpponent.new("Player2", ["Y", "Y", "Y", "Y"], 3)
            @players = [p1, p2]
        else 
            @players = players
        end

        @current_player_num = 0

        post_set_game_players 
        invariant 
    end

end 
