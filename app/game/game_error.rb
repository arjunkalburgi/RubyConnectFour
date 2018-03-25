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
        [InvalidCommand]
    end 

    def self.Wrong
        # Error: the state or condition of being wrong
        [MustBeHash, CannotBeEmpty]
    end
end 

class GameWon < GameError
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



class NotAValidColumn < GameError
    def initialize(columnnumber, msg = "Not a valid command")
        super(msg)
        @column = columnnumber
    end
end



class MustBeHash < GameError 
    def initialize(msg = "BUILTINS must be a Hash")
        super(msg)
    end
end 

class CannotBeEmpty < GameError 
    def initialize(msg = "BUILTINS cannot be empty")
        super(msg)
    end
end 
