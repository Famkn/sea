class Store
    attr_accessor :position, :name, :menu 

    def initialize(posx, posy, name, menu)
        @position = Struct.new(:x, :y).new(posx, posy)
        @name = name
        @menu = menu #dict {"nama_menu" => "harga"}
    end 

end