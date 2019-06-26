require_relative "point_obj"

class Store < PointObject
    attr_accessor :menu 

    def initialize(posx, posy, name, menu)
        super(posx, posy, name)
        @menu = menu
    end

    def print_menu
        @menu.each do |name, price|
            puts "#{name}. Harganya: #{price}" 
        end
    end

end