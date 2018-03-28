require_relative './gui/gui'
require_relative './game/game'
require_relative './game/game_error'

class GameController
    attr_reader :game, :gui, :type

    def initialize
        setup_view
    end

    def column_press(column=nil, value=nil)
        row = @game.play_move(column, value)
    end

    def setup_view
        @gui = GUI.new(self)
    end

    def setup_game(rows, columns, type, num_players, player_names)
        player_names[0].empty? ? name1 = "Player1" : name1 = player_names[0]
        player_names[1].empty? ? name2 = "Player2" : name2 = player_names[1]
        red_yellow = [["R", "R", "R", "R"],["Y", "Y", "Y", "Y"]]
        otto_toot = [["O", "T", "T", "O"],["T", "O", "O", "T"]]

        if type == "Connect4"
            p1 = Player.new(name1, red_yellow[0])
            if num_players == "1"
                p2 = AIOpponent.new(name2, red_yellow[1], 3)
            else 
                p2 = Player.new(name2, red_yellow[1])
            end
        else
            p1 = Player.new(name1, otto_toot[0]) 
            if num_players == "1"
                p2 = AIOpponent.new(name2, otto_toot[1], 3)
            else
                 p2 = Player.new(name2, otto_toot[1])
            end
        end

        @game = Game.new(rows,columns,[p1,p2],true)
    end

    def subscribe(observer)
        @game.add_observer(observer)
    end
end