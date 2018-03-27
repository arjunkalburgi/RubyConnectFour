require_relative './gui/gui'
# require_relative './player/player'
require_relative './game/game'

class GameController
    attr_reader :game, :gui, :type

    def initialize
        setup_view
    end

    def start_game
        @gui.start_game
    end

    def quit
        @gui.kill
    end

    def restart
        @gui.kill
        setup_view
        start_game
    end

    def column_press(column, value)
        row = @game.play_move(column, value)
        @gui.update_value(column, row, value)
    end

    def setup_view
        @gui = GUI.new(self)
    end

    def setup_game(rows, columns, type, num_players)
      if type == "Connect4"
        p1 = Player.new("Player1", ["X", "X", "X", "X"]) 
        if num_players == "1"
          p2 = AIOpponent.new("Player2", ["O", "O", "O", "O"], 3)
        else 
          p2 = Player.new("Player2", ["O", "O", "O", "O"])
        end
      else
        p1 = Player.new("Player1", ["O", "T", "T", "O"]) 
        if num_players == "1"
          p2 = AIOpponent.new("Player2", ["T", "O", "O", "T"], 3)
        else
          p2 = Player.new("Player2", ["T", "O", "O", "T"])
        end
      end
      @game = Game.new(rows,columns,[p1,p2])
    end
end