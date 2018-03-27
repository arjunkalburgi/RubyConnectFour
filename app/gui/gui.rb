require_relative './gui_contracts'
require "gtk3"

class GUI 
    include GUIContracts
    attr_reader :window, :controller, :pics, :type, :num_players, :rows, :columns
	
    def initialize(controller)
        #pre_initialize
        #invariant
		
		show_start_menu
        reset_images
        @controller = controller
        @controller.subscribe(self)
        
        #post_initialize
        #invariant
    end
    
    def show_start_menu
        menu_glade = "#{File.expand_path(File.dirname(__FILE__))}/menuLayout.glade"
		builder = Gtk::Builder.new(:file => menu_glade)
		
		@window = builder.get_object("menuWindow")
		@window.signal_connect("destroy") {Gtk.main_quit}
        @window.title = "ConnectFour"
        @window.set_position(Gtk::WindowPosition::CENTER)

        @type = builder.get_object("GameTypes")
        @num_players = builder.get_object("NumberPlayers")
        @rows = builder.get_object("Rows")
        @columns = builder.get_object("Columns")
		
        quitButton = builder.get_object("QuitButton")
        quitButton.signal_connect("clicked") {Gtk.main_quit}

		startButton = builder.get_object("StartButton")
		startButton.signal_connect("clicked") {generate_board}
		
        @window.show_all
        Gtk.main
    end
    
    def generate_board
		v = Gtk::VBox.new

        # toolbar = Gtk::Toolbar.new
        # file_menu = Gtk::ToolButton.new(nil, "Restart")
        # file_menu.signal_connect("clicked") {
        #   # @controller.restart
        #   Gtk.main_quit
        # }
        # toolbar.insert(0, file_menu)

        # v.add(toolbar)
        if @type.ActiveText == "Connect4"
            v.pack_start(create_buttons("X", "X"))
        else
            v.pack_start(create_buttons("O", "O"))
            v.pack_start(create_buttons("T", "T"))
        end

        # SOMEHOW NEED TO DEAL WITH PLAYERS!!!!

        (0..@rows).each{|a|
          v.pack_end(create_grid_row)
        }

        @window.add(v)
        @controller.setup_game(@rows, @columns)
    end

    def create_buttons(value, label)
        btns = Gtk::HBox.new
        (0..@columns).each_with_index{|b,col|
          btn = Gtk::Button.new("Place #{label}")
          btn.signal_connect("clicked") {
            @controller.button_column(col)
          }
          btns.pack_start(btn)
        }
        return btns
    end

    def create_grid_row
        h = Gtk::HBox.new
        (0..@columns).each{|b|
          h.pack_start(Gtk::Image.new(@pics["E"]))
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
        invariant 
        pre_show_winner

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

        post_show_winner
        invariant
    end
	
	def display_error_message(message)
		invariant
		pre_display_error_message
		
		post_display_error_message
		invariant
	end

    def exit_from_error 
        invariant 
        pre_exit_from_error

        post_exit_from_error
        invariant
    end

    def quit
        invariant 
        pre_quit

        @window.destroy

        post_quit
        invariant
    end

    def reset_images
        @pics = Hash.new
        @pics["E"] = "./assets/E.png"
        @pics["X"] = "./assets/X.png"
        @pics["O"] = "./assets/O.png"
        @pics["T"] = "./assets/T.png"
    end

    def update_value(x, y, v)
        @window.children[0].children.reverse[y].children[x].set(@pics[v])
    end

end
