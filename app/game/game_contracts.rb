require_relative '../player/player'
require_relative '../board/board'
require_relative '../game/game_components'
require_relative '../game/game_error'

module GameContracts

    def invariant 
        raise "board must be of the Board class" unless @board.is_a? Board
        raise "Current player must exist within the range of players" unless @current_player_num.between?(0, @players.size-1)
        raise "Players must be an array" unless @players.kind_of? Array 
        @players.each { |player|
            raise "Each item in the list of players must be of the Player class" unless player.is_a? Player 
        }
    end 


    
    def pre_init(rows, columnds, players) 
        raise "Rows must be a number" unless rows.is_a? Integer
        raise "Columns must be a number" unless columns.is_a? Integer
        raise "Number of rows must be greater than 0" unless rows > 0 
        raise "Number of columns must be greater than 0" unless columns > 0

        if !players.nil?
            raise TypeError, "Given players argument must be an array" unless players.kind_of? Array
            players.each { |player|
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