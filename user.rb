class User
    attr_accessor :position
    def initialize(posx, posy)
        @position = Struct.new(:x, :y).new(posx, posy)
    end

end