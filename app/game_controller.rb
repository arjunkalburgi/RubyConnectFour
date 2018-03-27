require_relative './gui/gui'
require_relative './game/game'
require_relative './game/game_error'

class GameController
    attr_reader :game, :gui, :type

    def initialize
        setup_view
    end

    def quit
        @gui.quit
    end

    def column_press(column=nil, value=nil)
        row = @game.play_move(column, value)
        # puts @game.board.print_board
        # @gui.update_value(column, row, value)
    end

    def setup_view
        @gui = GUI.new(self)
    end

    # def show_winner(winner="No winner")
    #     @gui.show_winner(winner)
    # end

    def setup_game(rows, columns, type, num_players)
      if type == "Connect4"
        p1 = Player.new("Player1", ["R", "R", "R", "R"]) 
        if num_players == "1"
          p2 = AIOpponent.new("Player2", ["Y", "Y", "Y", "Y"], 3)
        else 
          p2 = Player.new("Player2", ["Y", "Y", "Y", "Y"])
        end
      else
        p1 = Player.new("Player1", ["O", "T", "T", "O"]) 
        if num_players == "1"
          p2 = AIOpponent.new("Player2", ["T", "O", "O", "T"], 3)
        else
          p2 = Player.new("Player2", ["T", "O", "O", "T"])
        end
      end
      @game = Game.new(rows,columns,[p1,p2],true)
    end

    def subscribe(observer)
      @game.add_observer(observer)
    end
end