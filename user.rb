require_relative "point_obj"

class User < PointObject
    def initialize(posx, posy, name)
        super(posx, posy, name)
    end

end