require_relative './gui/gui'
require_relative './game/game'
require_relative './game/game_error'

class GameController
    attr_reader :game, :gui, :type, :num_players, :current_player

    def initialize
        @gui = GUI.new(self)
    end

    def column_press(column, value, gui)
        current_player = @game.players[@game.current_player_num]
        begin
            @game.play_move(column, value)
            @game.play_move if num_players == "1"
        rescue *GameError.GameEnd => game_end
            if game_end.is_a? GameWon
                puts "Congratulations, we have a winner"
                puts game_end.player.player_name + " won with the combination: " + game_end.player.player_win_condition.to_s
                gui.show_winner(game_end.player.player_name + " won!")
            else
                puts "There are no more possible moves. It's a cats game!"
                gui.show_winner("No winner")
            end
            return
        rescue *GameError.TryAgain => slip
            if slip.is_a? NotAValidColumn
                slip.column ? (puts "Column number: " + slip.column + " is not valid.") : (puts "Column number is not valid.")
            end 
            @game.reset_current_player(current_player)
            puts current_player.player_name + " please try your move again."
            gui.show_error(current_player.player_name + " please try your move again.")
            return
        rescue *GameError.Wrong => error 
            puts "Something went wrong sorry"
            puts error.message
            gui.show_error(error.message,true)
            return
        end  
        
    end

    def setup_game(rows, columns, type, num_players, player_names)
        player_names[0].empty? ? name1 = "Player1" : name1 = player_names[0]
        player_names[1].empty? ? name2 = "Player2" : name2 = player_names[1]
        red_yellow = [["R", "R", "R", "R"],["Y", "Y", "Y", "Y"]]
        otto_toot = [["O", "T", "T", "O"],["T", "O", "O", "T"]]
        max_turns = ["O", "O", "O", "O", "O", "O", "T", "T", "T", "T", "T", "T"]

        @num_players = num_players

        if type == "Connect4"
            p1 = Player.new(name1, red_yellow[0])
            if num_players == "1"
                p2 = AIOpponent.new(name2, red_yellow[1], 3)
            else 
                p2 = Player.new(name2, red_yellow[1])
            end
            token_limitations = false
        else
            p1 = Player.new(name1, otto_toot[0], max_turns) 
            if num_players == "1"
                p2 = AIOpponent.new(name2, otto_toot[1], 3, max_turns)
            else
                 p2 = Player.new(name2, otto_toot[1], max_turns)
            end
            token_limitations = true
        end

        @game = Game.new(rows, columns, [p1,p2], token_limitations, true)
    end

    def subscribe(observer)
        @game.add_observer(observer)
    end
end