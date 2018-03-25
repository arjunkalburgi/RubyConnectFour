require_relative './game/game'
require_relative './game/game_error'

g = Game.new

while not g.board.is_full? 
    g.board.print_board

    current_player = g.get_current_player
    if current_player.is_a? AIOpponent
        column = nil
    else 
        puts current_player.player_name + ", what column number would you like to input your token into: "
        user_input = gets.chomp
        column = user_input.to_i
    end 

    begin
        g.play_move(column)
    rescue *GameError.GameEnd => winner 
        puts "Congratulations this is the winner"
        puts winner
        break 
    rescue *GameError.TryAgain => slip
        puts "That was no good, please try again"
        next
    rescue *GameError.Wrong => error 
        puts "Something went wrong sorry"
        exit
    end
    
end 

puts "Wanna play again?"