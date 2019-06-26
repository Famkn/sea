class PointObject
    attr_accessor :position, :name
    def initialize(posx, posy, name)
        @position = Struct.new(:x, :y).new(posx, posy)
        @name = name
    end
end