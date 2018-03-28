module GameControllerContracts

	def invariant
		# no invariant
	end
	
	def pre_initialize
		# no pre conditions
	end
	
	def post_initialize
		# no post conditions
	end
	
	def pre_column_press
		# no pre conditions
	end
	
	def post_column_press
		# no post conditions -board change post conditions are handled by game contracts
	end
	
	def pre_setup_view
		# no pre conditions
	end
	
	def post_setup_view
		# no post conditions
	end
	
	def pre_setup_game
		# many preconditions that could be checked here are already being 
		# checked in other areas of the code, thus there is no need to check
		# them again. 
	end
	
	def post_setup_game
		# no post conditions
	end
	
	def pre_subscribe
		# no pre conditions
	end
	
	def post_subscribe
		# no post conditions
	end

end