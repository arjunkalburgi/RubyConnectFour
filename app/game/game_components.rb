module GameType 
    ConnectFour = 1
    TOOT = 2
    OTTO = 3

    def self.is_defined?(type)
        [ConnectFour, TOOT, OTTO].include? type
    end 
end 