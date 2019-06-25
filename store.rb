require_relative "point_obj"

class Store < PointObject
    attr_accessor :menu 

    def initialize(posx, posy, name, menu)
        # @position = Struct.new(:x, :y).new(posx, posy)
        # @name = name
        super(posx, posy, name)
        @menu = menu #dict {"nama_menu" => "harga"}
    end

    def print_menu
        @menu.each do |name, price|
            puts "#{name}. Harganya: #{price}" 
        end
    end

end