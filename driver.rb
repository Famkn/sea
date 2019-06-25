require_relative "point_obj"
class Driver < PointObject
    attr_accessor :rating, :first_time, :total_trip
    
    def initialize(posx, posy, name, rating, first_time, total_trip=0)
        # @position = Struct.new(:x, :y).new(posx, posy)
        # @name = name
        super(posx, posy, name)
        @rating = rating
        @first_time = first_time
        @total_trip = total_trip
    end

end
