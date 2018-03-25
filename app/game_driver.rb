require_relative './game/game'
require_relative './game/game_error'

g = Game.new

while true
    puts g.board.print_board

    current_player = g.get_current_player
    if current_player.is_a? AIOpponent
        puts "AI's turn"
        column = nil
    else 
        puts current_player.player_name + ", what column number would you like to input your token into: "
        user_input = gets.chomp
        column = user_input.to_i - 1
    end 

    begin
        g.play_move(column)
    rescue *GameError.GameEnd => gameend
        if gameend.is_a? GameWon
            puts "Congratulations, we have a winner"
            puts gameend.player.player_name + " won with the combination: " + gameend.player.player_win_condition
            puts g.board.print_board
        else 
            puts "There are no more possible moves."
            puts g.board.print_board
            puts "It's a cats game!."
        end
        break 
    rescue *GameError.TryAgain => slip
        if slip.is_a? NotAValidColumn
            puts "Column number: " + slip.column + " is not valid." 
        end 
        reset_current_player(current_player)
        puts current_player.player_name + " please play again."
        next
    rescue *GameError.Wrong => error 
        puts "Something went wrong sorry"
        exit
    end
    
end 

puts "Wanna play again?"