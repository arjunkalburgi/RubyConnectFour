require_relative '../player/player'
require_relative '../board/board'
require_relative '../board/board_components'
require_relative '../board/game_components'
require_relative '../game/game_error'

module GameContracts

    def invariant 
        raise "error" unless @b.is_a? Board
        raise "error" unless @b.dimensions.is_a? BoardDimensions
        
        raise "error" unless @current_player_num.between?(0, @players.size-1)
        raise "error" unless @players.kind_of? Array 
        @players.each { |player|
            raise "error" unless player.is_a? Player 
        }

        raise "error" unless GameType.is_defined? @type 

        # should add a "game_state" or something?
    end 


    
    def pre_init(t, d, p) 
        if !t.nil?
            raise TypeError, "Given type is not defined in module Type" unless t is GameType::ConnectFour or t is GameType::TOOT or t is GameType::OTTO
        end 
        
        if !d.nil?
            raise TypeError, "Given dimensions are not of type BoardDimensions" unless d.is_a? BoardDimensions
        end

        if !p.nil?
            raise TypeError, "Given players argument must be an array" unless p.kind_of? Array
            p.each { |player|
                raise "All players in players argument must be of type Player" unless player.is_a? Player
            }
        end
    end
    
    def post_init
        # do nothing 
    end



    def pre_get_current_player  
        # do nothing 
        @current_player_num
    end
    
    def post_get_current_player(num)
        # check num 
        raise "Incrementing player number did not work properly" unless @current_player_num - 1 == num 

        # check player
        p = @players[@current_player_num]
        raise "Object in players is not of type Player" unless p.is_a? Player
    end



    def pre_play_move(c)
        # don't put board checks here, they'll go in board.add_piece
    end
    
    def post_play_move
        # check if game state is still playable 
        # check if board's invariant 
    end



    def pre_set_game_type 
        # do nothing 
    end
    
    def post_set_game_type
        # do nothing 
    end



    def pre_set_game_dimensions 
        # do nothing 
    end
    
    def post_set_game_dimensions 
        # do nothing 
    end



    def pre_set_game_players 
        # do nothing 
    end
    
    def post_set_game_players 
        # do nothing 
    end



    def pre_increment_player 
        # do nothing 
    end
    
    def post_increment_player
        # do nothing 
    end



    def pre_check_game
        # do nothing 
    end

    def post_check_game
        # do nothing 
    end

    
end