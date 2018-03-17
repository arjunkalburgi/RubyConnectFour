require_relative './game_contracts'

require_relative './ai/ai'
require_relative './board/board'
require_relative './player'


class Game 
    extend GameContracts


    def initialize(type=None, dimensions=None, players=None)
        invariant
        pre_init

        set_game_type(type)
        set_game_dimensions(dimensions)
        set_game_players(players)

        post_init
        invariant
    end


    def get_current_player
        invariant 
        pre_get_current_player 

        @rows = r
        @columns = c

        post_get_current_player
        invariant 
    end

    def play_move(player, column)
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

        if type is None: 
            @type = "C4"
        else 
            @type = type 

        post_set_game_type
        invariant
    end

    def set_game_dimensions(dim)
        invariant 
        pre_set_game_dimensions

        if type is None: 
            @rows = 6
            @columns = 7
        else 
            @rows = dim.rows
            @columns = dim.columns

        post_set_game_dimensions 
        invariant 
    end

    def set_game_players(players)
        invariant 
        pre_set_game_players

        if players is None: 
            p1 = Player.new("blue") 
            p3 = AIOpponent.new("yellow", 1)
            @players = [p1, p2, p3]
        else 
            @players = players

        @current_player = 0

        post_set_game_players 
        invariant 
    end

    def increment_player
        invariant 
        pre_increment_player

        num_players = len(@players)
        if @current_player++ >= num_players: 
            @current_player = 0 

        post_increment_player
        invariant 
    end

    def check_game
    end

end 