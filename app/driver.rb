require_relative './game/game'

require_relative './board/board'

require_relative './player/player'
require_relative './player/ai/ai'

require_relative './gui/gui'

v = Gui.new 

game_type = v.get_game_type
dimensions = v.get_game_dimensions 
players_list = v.get_game_players

g = Game.new(game_type, dimensions, players_list)

v.start_game 

while true do

    current_player = g.get_current_player
    column = v.request_player_move(current_player)
    v.wait_for_computer

    begin
        b = g.play_move(column) 
        # This call should also block, do not continue until the game is ready (ai). 
        v.update_board(b)
    rescue *GameError.GameWon => winner 
        puts "Congratulations this is the winner"
        v.update_board(winner.b)
        v.show_winner(winner.player, winner.b, winner.winning_set)
        break 
    rescue *GameError.TryAgain => slip
        puts "That was no good, please try again"
        v.request_player_move_again(player) 
        next
    rescue *GameError.Wrong => error 
        puts "Something went wrong sorry, run the file to play again"
        v.exit_from_error 
        exit
    end
        
    puts "This all worked"
    break
end 

g.quit
v.quit

puts "Run the file to play again?"