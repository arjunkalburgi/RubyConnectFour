module GUIContracts

    def invariant 
        # image files exist?
    end 


    def pre_show_start_menu(menuLayoutFile, gameLayoutFile)
		raise "Menu layout does not exist" unless File.exist?(menuLayoutFile)
		raise "Game layout does not exist" unless File.exist?(gameLayoutFile)
    end
    
    def post_show_start_menu
		# no post conditions
    end
    
    def pre_generate_board
		# no pre conditions
    end
    
    def post_generate_board
		 # no post conditions
    end
    
    def pre_create_buttons
		# no pre conditions
    end 
    
    def post_create_button
		# no post conditions
    end
    
    def pre_create_grid_row
		# ensure all image files are still valid
		@pics.each do |fileID, filename|
			raise "Image asset file path is invalid" unless File.exist?(filename)
		end
    end
    
    def post_create_grid_row
		# no post cinditions
    end
    
    def pre_show_winner
		# no pre conditions
    end
    
    def post_show_winner
		# no post conditions
    end
    
    def pre_quit
		# no pre conditions
    end
    
    def post_quit
		# no post conditions
    end
    
    def pre_set_images
		# no pre conditions
    end
    
    def post_set_images
		# make sure that all files set are valid files
		@pics.each do |fileID, filename|
			raise "Image asset file path is invalid" unless File.exist?(filename)
		end
    end
    
    def pre_update_value(value)
		raise "Image asset file path is invalid" unless File.exist?(@pics[value])
    end
    
    def post_update_value
		# no post conditions
    end
    
    def pre_update_buttons
		# no pre conditions
    end
    
    def post_update_buttons
		# no post conditions
    end

end
