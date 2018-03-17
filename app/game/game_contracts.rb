require_relative '../player/player'
require_relative '../board/board_components'

module GameContracts

    def invariant 
        # do nothing 

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
    end
    
    def post_get_current_player
        # do nothing 
    end



    def pre_play_move 
        # do nothing 
    end
    
    def post_play_move
        # do nothing 
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