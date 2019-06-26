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


    def delete_driver
        # replace all driver with "."
        # puts "replace all driver with ."
        
        @drivers.each  {|driver| @grid[driver.position.y][driver.position.x] = "."}
        
        # delete bad driver
        @drivers.delete_if { |driver| !driver.first_time && driver.rating < 3.0 } 
        
        # # generate good driver only
        @drivers.each {|good_driver| @grid[good_driver.position.y][good_driver.position.x] = good_driver.name} 

    end

end

