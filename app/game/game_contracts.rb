require_relative '../player/player'
require_relative '../board/board'
require_relative '../game/game_components'
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
    end 


    
    def pre_init(d, p) 
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
        # nothing to do 
    end



    def pre_get_current_player  
        # nothing to do 
        @current_player_num
    end
    
    def post_get_current_player(old_num)
        # check num 
        raise "Incrementing player number did not work properly" unless @current_player_num - 1 == old_num or @current_player_num == 0

        # check player
        p = @players[@current_player_num]
        raise "Object in players is not of type Player" unless p.is_a? Player
    end



    def pre_play_move(c)
        # don't put board checks here, they'll go in board.add_piece
    end
    
    def post_play_move(old_board)
        raise "Board has not changed, something went wrong" unless old_board != @board
    end




    def pre_check_game
        # nothing to do 
    end

    def post_check_game
        # nothing to do 
    end


    def pre_increment_player 
        @current_player_num
    end
    
    def post_increment_player(old_num) 
        raise "Incrementing player number did not work properly" unless old_num == @players.size ? @current_player_num == 0 : @current_player_num - 1 == old_num
    end


    def pre_set_game_dimensions
        # nothing to do 
    end 

    def post_set_game_dimensions
        # nothing to do 
    end 


    def pre_set_game_players
        # nothing to do 
    end 

    def post_set_game_players
        # nothing to do 
    end 



    
end