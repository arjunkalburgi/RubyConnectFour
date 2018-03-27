class GameError < StandardError

    <<-DOC
        
        Modification Instructions
    
        The Shell will only rescue slips and errors listed in the
        self.SlipsList and self.ErrorsList functions. To add more exceptions, 
        implement a new exception class that implements GameError, and 
        add your exception name to the SlipsList or ErrorsList
        
    DOC
    
    attr_reader :message
    
    def initialize(msg = "Standard Ruby Shell Error")
        @message = "ERROR: " + msg + "\n"
        super(msg)
    end

    def self.GameEnd
        [NoMoreMoves, GameWon]
    end

    def self.TryAgain
        #  Slip: a minor or careless mistake
        # when the user does something incorrect
        [NotAValidColumn]
    end 

    def self.Wrong
        # Error: the state or condition of being wrong
        # when the game has an error
        [GameError]
    end
end 

# Game End Errors 
class GameWon < GameError
	attr_reader :player
    def initialize(player, msg = " has won!")
        super(player.player_name + msg)
        @player = player 
    end 
end 

class NoMoreMoves < GameError
    def initialize(msg = "No moves left")
        super(msg)
    end 
end 


# Try Again Errors 
class NotAValidColumn < GameError
    def initialize(columnnumber, msg = "Not a valid command")
        super(msg)
        @column = columnnumber
    end
end

class IncorrectInput < GameError 
    def initialize(msg = "Input into this function is not correct", *args)
        super(msg) 
        puts "Inputs: "
        args.each do |key, val| 
            puts key + ": " + value
        end
    end 
end

