require_relative "point_obj"

class User < PointObject
    def initialize(posx, posy, name)
        super(posx, posy, name)
        # @position = Struct.new(:x, :y).new(posx, posy)
    end

end