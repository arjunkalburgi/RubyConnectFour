require_relative './game_contracts'
require_relative './game_error'
require_relative './game_components'

require_relative '../board/board'
require_relative '../player/player'
require_relative '../player/ai'


class Game 
    include GameContracts
    attr_reader :players, :board, :current_player_num

    def initialize(rows=nil, columns=nil, players=nil)
        pre_init(rows, columns, players)

        set_game_dimensions(rows, columns)
        set_game_players(players)

        post_init
        invariant
    end


    def get_current_player
        invariant 
        beforenum = pre_get_current_player 

        increment_player
        
        post_get_current_player(beforenum)
        invariant 

        @players[@current_player_num]
    end

    def play_move(column)
        invariant 
        pre_play_move(column)

        @board.add_piece(column, @players[@current_player_num])
        check_game

        post_play_move
        invariant 

        @board
    end

    def quit
    end

    private

    def check_game
        # check win 
        # check board for the player's string
    end

    def increment_player
        invariant 
        old_num = pre_increment_player

        @current_player_num++
        if @current_player_num >= @players.size
            @current_player_num = 0
        end

        post_increment_player(old_num)
        invariant 
    end

    def set_game_dimensions(row=6, columns=7)
        invariant 
        pre_set_game_dimensions

        @board = Board.new(6,7)

        post_set_game_dimensions 
        invariant 
    end

    def set_game_players(players)
        invariant 
        pre_set_game_players

        if players.nil? 
            p1 = Player.new("Player1", ["R", "R", "R", "R"]) 
            p2 = AIOpponent.new("Player2", ["Y", "Y", "Y", "Y"], 1)
            @players = [p1, p2]
        else 
            @players = players
        end

        @current_player_num = 0

        post_set_game_players 
        invariant 
    end

end 