require_relative "map"
require_relative "const"


module Generator
    
    def getRandomWithExclusion(start, finish, exclude)
        random = start + rand(finish - start - exclude.size)
        exclude.each do |num|
            if random < num 
                break
            end
            random += 1
        end
        random
    end

    def generate_drivers(map)
        for i in range 1..5 do
            size = map.size
            pos = rand(size)
            posx = pos % size
            posy = pos / size
            # initialize(posx, posy, name, rating, first_time)
            driver = Driver(posx, posy, i, 0, true)
            map.insert(driver)
        end
    end

    def generate_stores(map)
        for i in range 0..2 do
            size = map.size
            pos = rand(size)
            posx = pos % size
            posy = pos / size
            store = Store(posx, posy, name, Const.MENU[i])
        end
    end
    
        # Randomize user position
        user_pos rand(size)
        
        
        user_pos = getRandomWithExclusion(0, n, exclude)
        exclude << user_pos

        # Randomize stores position
        store_pos = []
        for i in 0..2 do
            temp = getRandomWithExclusion(0, n, exclude)
            store_pos << temp
            exclude << temp
        end

        # Randomize drivers position
        driver_pos = []
        for i in 0..4 do
            temp = getRandomWithExclusion(0, n, exclude)
            driver_pos << temp
            exclude << temp
        end
        map = x = Array.new(n) { Array.new(n){"."} }
    end
end
