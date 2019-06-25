require_relative "point_obj"
class Driver < PointObject
    attr_accessor :rating, :first_time, :total_trip
    
    def initialize(posx, posy, name)
        # @position = Struct.new(:x, :y).new(posx, posy)
        # @name = name
        super(posx, posy, name)
        @rating = 0
        @first_time = true
        @total_trip = 0
    end

end
