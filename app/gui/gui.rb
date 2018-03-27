require_relative './gui_contracts'
require "gtk3"

class GUI 
    include GUIContracts
    attr_reader :window, :game_window, :controller, :pics, :type, :num_players, :rows, :columns
	
    def initialize(controller)
        #pre_initialize
        #invariant
		
		@controller = controller
        set_images
        show_start_menu
        
        #post_initialize
        #invariant
    end
    
    def show_start_menu
        menu_glade = "#{File.expand_path(File.dirname(__FILE__))}/menuLayout.glade"
        game_layout = "#{File.expand_path(File.dirname(__FILE__))}/gameLayout.glade"

		builder = Gtk::Builder.new(:file => menu_glade)
        game_builder = Gtk::Builder.new(:file => game_layout)
		
		@window = builder.get_object("menuWindow")
		@window.signal_connect("destroy") {Gtk.main_quit}
        @window.title = "ConnectFour"
        @window.set_position(Gtk::WindowPosition::CENTER)

        @game_window = game_builder.get_object("GameWindow")
        @game_box = game_builder.get_object("gameBox")
        @game_window.signal_connect("destroy") {Gtk.main_quit}
        @game_window.title = "Game"
        @game_window.set_position(Gtk::WindowPosition::CENTER)

        @type = builder.get_object("GameTypes")
        @num_players = builder.get_object("NumberPlayers")
        @rowsObject = builder.get_object("Rows")
        @columnsObject = builder.get_object("Columns")
		
        quitButton = builder.get_object("QuitButton")
        quitButton.signal_connect("clicked") {Gtk.main_quit}

		startButton = builder.get_object("StartButton")
		startButton.signal_connect("clicked") {generate_board}
		
        @window.show_all
        Gtk.main
    end
    
    def generate_board
		v = Gtk::Box.new(:vertical)

        # @rows = @rowsObject.value_as_int
        # @columns = @columnsObject.value_as_int
        @rows = 6
        @columns = 7
        puts @rows
        puts @columns

        if @type.active_text == "Connect4"
            v.pack_start(create_buttons("X"))
        else
            v.pack_start(create_buttons("O"))
            v.pack_start(create_buttons("T"))
        end

        (1..@rows).each{|a|
          v.pack_end(create_grid_row)
        }

        @game_box.add(v)
        @game_window.show_all
        @controller.setup_game(@rows, @columns, @type.active_text, @num_players.active_text)
    end

    def create_buttons(value)
        btns = Gtk::Box.new(:horizontal)
        (1..@columns).each{|col|
          btn = Gtk::Button.new(:label => "Place #{value}")
          btn.signal_connect("clicked") {
            @controller.column_press(col, value)
          }
          btns.pack_start(btn)
        }
        return btns
    end

    def create_grid_row
        h = Gtk::Box.new(:horizontal)
        (1..@columns).each{|b|
            h.pack_start(Gtk::Image.new(:file => @pics["E"]))
        }
        return h
    end

    # def update_board(b)
    #     invariant 
    #     pre_update_board

    #     post_update_board
    #     invariant
    # end

    def show_winner(player)
        # invariant 
        # pre_show_winner

        dialog = Gtk::Dialog.new(
          "Game Over",
          @window,
          Gtk::Dialog::MODAL
        )

        btnRestart = Gtk::Button.new("New Game")
        btnRestart.signal_connect("clicked"){
          @controller.restart
          dialog.close
        }
        btnExit = Gtk::Button.new("Quit")
        btnExit.signal_connect("clicked"){
          @controller.quit
        }

        hbox = Gtk::HBox.new
        hbox.pack_start(btnRestart)
        hbox.pack_start(btnExit)

        dialog.vbox.add(Gtk::Label.new(message))
        dialog.vbox.add(hbox)

        dialog.show_all

        # post_show_winner
        # invariant
    end
	
	# def display_error_message(message)
	# 	invariant
	# 	pre_display_error_message
		
	# 	post_display_error_message
	# 	invariant
	# end

 #    def exit_from_error 
 #        invariant 
 #        pre_exit_from_error

 #        post_exit_from_error
 #        invariant
 #    end

    def quit
        invariant 
        pre_quit

        @window.destroy
        @game_window.destroy

        post_quit
        invariant
    end

    def set_images
        @pics = Hash.new
        @pics["E"] = "./assets/E.png"
        @pics["X"] = "./assets/X.png"
        @pics["O"] = "./assets/O.png"
        @pics["T"] = "./assets/T.png"
    end

    def update_value(column, row, value)
        @game_window.children[0].children.reverse[row].children[column].set(@pics[value])
    end

end
