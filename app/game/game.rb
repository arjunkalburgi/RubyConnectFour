require_relative './game_contracts'
require_relative './game_error'
require_relative './game_components'

require_relative '../board/board'
require_relative '../player/player'
require_relative '../player/ai/ai'


class Game 
    include GameContracts
    attr_reader :get_current_player_num, :play_move, :quit

    def initialize(type=nil, dimensions=nil, players=nil)
        invariant
        pre_init(type, dimensions, players)

        set_game_type(type)
        set_game_dimensions(dimensions)
        set_game_players(players)

        post_init
        invariant
    end


    def get_current_player
        invariant 
        pre_get_current_player 

        increment_player
        
        post_get_current_player
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
    end

    def increment_player
        invariant 
        pre_increment_player

        @current_player_num++
        if @current_player_num >= num_players.size
            @current_player_num = 0
        end

        post_increment_player
        invariant 
    end

    def set_game_type(type)
        invariant
        pre_set_game_type

        if type.nil? 
            @type = GameType::ConnectFour
        else 
            @type = type 
        end

        post_set_game_type
        invariant
    end

    def set_game_dimensions(dim)
        invariant 
        pre_set_game_dimensions

        if dim.nil? 
            @board = Board.new(BoardDimensions.new(6, 7))
        else 
            @board = Board.new(dim)
        end

        post_set_game_dimensions 
        invariant 
    end

    def set_game_players(players)
        invariant 
        pre_set_game_players

        if players.nil? 
            p1 = Player.new("blue") 
            p2 = AIOpponent.new("yellow", 1)
            @players = [p1, p2]
        else 
            @players = players
        end

        @current_player_num = 0

        post_set_game_players 
        invariant 
    end

end 