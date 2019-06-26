require_relative "tool"

class Map
    attr_accessor :size, :drivers, :stores, :user, :grid
    def initialize(size = 20)
        @size = size
        @drivers = []
        @stores = []
        @user = nil
        @grid = Array.new(size) { Array.new(size,".") }
    end


    def print_map
        for i in 0...size
            for j in 0...size
                print @grid[i][j] + " "
            end
            print "\n"
        end
        print "\n"
    end

    def insert(object)
        raise "#{object.class} position is out of bound" if Tool.out_of_bound?(object.position, @size)
        if !object.is_a?(PointObject)
            raise "error inserting object into map. object must be driver, store, or user."
        else
            if object.is_a?(Driver)
                @drivers << object
            elsif object.is_a?(Store)    
                @stores << object
            else
                @user = object
            end
            @grid[object.position.y][object.position.x] = object.name      
        end
    end

    def drivers_empty?
        @drivers.length == 0
    end

end

