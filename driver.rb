class Driver
    attr_accessor :position, :name, :rating, :first_time
    
    def initialize(posx, posy, name, rating, first_time)
        @position = Struct.new(:x, :y).new(posx, posy)
        @name = name
        @rating = rating
        @first_time = first_time
    end

end
