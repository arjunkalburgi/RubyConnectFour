require_relative './game/game'

require_relative './board/board'

require_relative './player/player'
require_relative './player/ai'

g = Game.new 

b = Board.new(7, 6)
g.set_game_dimensions(b.get_dimensions)

p1 = Player.new("Player1", ["R", "R", "R", "R"], "R") 
p2 = Player.new("Player2", ["Y", "Y", "Y", "Y"], "Y")
g.set_game_players([p1, p2])

g.start_game 

while True

    current_player = g.current_player
    column = 4 # input, player playername give me your column

    begin
        b = g.(b, current_player, column) #I think this should be b = g.(current_player, 5), g should have it's own instance of b.     
        puts b
    rescue *Game.GameWon => winner 
        puts "Congratulations this is the winner"
        puts winner
        break 
    rescue *Game.TryAgain => slip
        puts "That was no good, please try again"
        next
    rescue *Game.Wrong => error 
        puts "Something went wrong sorry"
        exit
    end
    
end 

puts "Wanna play again?"