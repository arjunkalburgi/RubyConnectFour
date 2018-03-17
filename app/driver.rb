require_relative './game/game'

require_relative './board/board'

require_relative './player/player'
require_relative './player/ai/ai'

require_relative './gui/gui'

g = Game.new 
v = Gui.new 

game_type = v.get_game_type
g.set_game_type(game_type)

dimensions = v.get_game_dimensions 
g.set_game_dimensions(dimensions) 
#b = Board.new(dimensions.row, dimensions.columns)

players_list = v.get_game_players
g.set_game_players(players_list)
# p1 = Player.new("blue") p2 = Player.new("red") p3 = AIOpponent.new("yellow", 1)

v.start_game 

while True

    current_player = g.current_player
    column = v.request_player_move(current_player)
    v.wait_for_computer

    begin
        b = g.play_move(b, current_player, column) 
        # I think this should be b = g.(current_player, column), g should have it's own instance of b.     
        # This call should also block, do not continue until the game is ready (ai). 
        v.update_board(b)
    rescue *Game.GameWon => winner 
        puts "Congratulations this is the winner"
        v.update_board(winner.b)
        v.show_winner(winner.player, winner.b, winner.winning_set)
        break 
    rescue *Game.TryAgain => slip
        puts "That was no good, please try again"
        v.request_player_move_again(player) 
        next
    rescue *Game.Wrong => error 
        puts "Something went wrong sorry, run the file to play again"
        v.exit_from_error 
        exit
    end
        
    
end 

puts "Run the file to play again?"