require_relative "tool"
# require_relative "driver"
# require_relative "store"
# require_relative "user"

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
        raise "#{obj.class} position is out of bound" if Tool.out_of_bound?(object.position, @size)
        if object.is_a?(Driver)
            @drivers << object
            @grid[object.position.y][object.position.x] = object.name
        elsif object.is_a?(Store)
            @stores << object
            @grid[object.position.y][object.position.x] = object.name
        elsif object.is_a?(User)
            @user = object
            @grid[object.position.y][object.position.x] = "U"
        else
            raise "error inserting object into map. object must be driver, store, or user."
        end

    end

    def drivers_empty?
        @drivers.length == 0
    end


end


# array2d = []
# array2d << [1,2,3]
# array2d << [4,5]

# array2d.each do |ar|
#     ar.each do |val|

#     end
# end

