class BoardDimensions 
    attr_reader :columns, :rows
    def initialize(r, c)
        raise "Must have 4 or more rows" unless r >=4 
        raise "Must have 4 or more columns" unless c >=4 
        
        @columns = r 
        @rows = c 
    end 
end