require_relative './game/game'
require_relative './game/game_error'
require 'set'

user_input = nil
while not Set["y","n"].include? user_input
    print "Would you like to be set to default (6x7, player 1 - you, player 2 - AI), y or n: "
    user_input = gets.chomp
end

if user_input == 'y'
    g = Game.new
else 
    print "Number of Columns: "
    columns = gets.chomp.to_i
    print "Number of Rows: "
    rows = gets.chomp.to_i
    while not Set["1","2"].include? user_input
        print "How many players? 1 or 2: "
        user_input = gets.chomp
    end 
    num_players = user_input.to_i
    
    user_input = nil
    while not Set["1","2"].include? user_input
        print "Would you like to play OTTO/TOOT(1) or ConnectFour(2) style? 1 or 2: "
        user_input = gets.chomp
    end 
    style = user_input

    print "P1 - What is your name? "
    name = gets.chomp
    
    if style == "1"
        puts name + " is playing for OTTO"
        p1 = Player.new(name, ["O","T","T","O"]) 
    else
        print "P1 - How many tokens? "
        num_token = gets.chomp.to_i
        print "P1 - What is your token? "
        token = gets.chomp
        p1 = Player.new(name, Array.new(num_token, token)) 
    end
    
    if num_players == 1
        if style == "1"
            p2 = AIOpponent.new("AIOpponent", ["T", "O", "O", "T"], 3)
        else
            print "What do you want the AI token to be? "
            token = gets.chomp
            p2 = AIOpponent.new("AIOpponent", Array.new(num_token, token), 3)
        end
    else 
        print "P2 - What is your name? "
        name = gets.chomp
        if style == "1"
            puts name + " is playing for TOOT"
            p2 = Player.new(name, ["T", "O", "O", "T"]) 
        else
            print "P2 - What is your token? "
            token = gets.chomp
            p2 = Player.new(name, Array.new(num_token, token))
        end
    end 
    g = Game.new(rows,columns,[p1, p2])
end

while true
    puts g.board.print_board

    current_player = g.get_current_player
    if current_player.is_a? AIOpponent
        puts current_player.player_name + "'s turn"
        column = nil
    else 
        token = nil
        if style == "1"
            while not Set["O","T"].include? token
                print "Would you like to place O or T: "
                token = gets.chomp
            end 
        end
        print current_player.player_name + ", what column number would you like to input your token into: "
        column = gets.chomp.to_i - 1
    end 

    begin
        g.play_move(column, token)
    rescue *GameError.GameEnd => gameend
        if gameend.is_a? GameWon
            puts "Congratulations, we have a winner"
            puts gameend.player.player_name + " won with the combination: " + gameend.player.player_win_condition.to_s
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
