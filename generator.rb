require_relative "map"
require_relative "const"
require_relative "driver"
require_relative "store"
require_relative "user"

module Generator
    extend self

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

    def generate_position(size)
        posx = rand(size)
        posy = rand(size)
        return posx, posy
    end

    def generate_drivers(map)
        for i in 1..5 do
            posx, posy = generate_position(map.size)
            driver = Driver.new(posx, posy, i, 0, true)
            map.insert(driver)
        end
    end

    def generate_stores(map)
        for i in 0..2 do
            posx, posy = generate_position(map.size)
            store = Store.new(posx, posy, (Const::RESTO_NAME + i).chr, Const::MENU[i])
            map.insert(store)
        end
    end

    def generate_user(map)
        posx, posy = generate_position(map.size)
        user = User.new(posx, posy)
        map.insert(user)
    end
    
    def generate_map(map)
        generate_drivers(map)
        generate_stores(map)
        generate_user(map)
    end
    #     # Randomize user position
    #     user_pos rand(size)
        
        
    #     user_pos = getRandomWithExclusion(0, n, exclude)
    #     exclude << user_pos

    #     # Randomize stores position
    #     store_pos = []
    #     for i in 0..2 do
    #         temp = getRandomWithExclusion(0, n, exclude)
    #         store_pos << temp
    #         exclude << temp
    #     end

    #     # Randomize drivers position
    #     driver_pos = []
    #     for i in 0..4 do
    #         temp = getRandomWithExclusion(0, n, exclude)
    #         driver_pos << temp
    #         exclude << temp
    #     end
    #     map = x = Array.new(n) { Array.new(n){"."} }
    # end
end
