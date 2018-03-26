require_relative './gui_contracts'
require "gtk3"

class GUI 
    include GUIContracts
    attr_reader :dimensions, :token_choices, :window
	
    def get_game_dimensions 
        return @dimensions
    end

    def initialize
    # def initialize(dimensions, token_choices)
        #pre_initialize(dimensions, token_choices)
		#@dimensions = dimensions
		#@token_choices = token_choices
		
		show_start_menu()
        
        #post_initialize
        #invariant
    end
    
    def show_start_menu()
        menu_glade = "#{File.expand_path(File.dirname(__FILE__))}/menuLayout.glade"
		builder = Gtk::Builder.new(:file => menu_glade)
		
		@window = builder.get_object("menuWindow")
		@window.signal_connect("destroy") {Gtk.main_quit}
        @window.title = "ConnectFour"
		
		startButton = builder.get_object("StartButton")
		startButton.signal_connect("clicked") {Gtk.main_quit}
		
		quitButton = builder.get_object("QuitButton")
		quitButton.signal_connect("clicked") {Gtk.main_quit}
		
        @window.show_all
        Gtk.main
		
    end
    
    def generate_board()
		
    end

    def update_board(b)
        invariant 
        pre_update_board

        post_update_board
        invariant
    end

    def show_winner(player)
        invariant 
        pre_show_winner

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

    private 




end
