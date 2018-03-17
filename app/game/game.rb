require_relative './game_contracts'
require_relative './game_error'
require_relative './game_components'

require_relative '../board/board'
require_relative '../player/player'
require_relative '../player/ai/ai'


class Game 
    include GameContracts
    attr_reader :get_current_player, :play_move, :quit

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



        post_get_current_player
        invariant 
    end

    def play_move(b, player, column)
        invariant 
        pre_play_move

        # playmove 
        check_game

        post_play_move
        invariant 
    end

    def quit
    end

    private 

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
            @rows = 6
            @columns = 7
        else 
            @rows = dim.rows
            @columns = dim.columns
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

        @current_player = 0

        post_set_game_players 
        invariant 
    end

    def increment_player
        invariant 
        pre_increment_player

        num_players = len(@players)
        @current_player++
        if @current_player >= num_players 
            @current_player = 0 
        end

        post_increment_player
        invariant 
    end

    def check_game
    end

end 