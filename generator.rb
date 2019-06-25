require_relative "const"
require_relative "tool"
require_relative "driver"
require_relative "store"
require_relative "user"

module Generator
    extend self

    def generate_position(size)
        posx = rand(size)
        posy = rand(size)
        return posx, posy
    end

    def generate_drivers(map)
        for i in 1..5 do
            posx, posy = generate_position(map.size)
            driver = Driver.new(posx, posy, (Const::DRIVER_NAME + i).chr, 0, true)
            map.insert(driver)
        end
    end

    def generate_stores(map)
        for i in 0..2 do
            posx, posy = generate_position(map.size)
            store = Store.new(posx, posy, i.to_s, Const::MENU[i])
            map.insert(store)
        end
    end

    def generate_user(map)
        posx, posy = generate_position(map.size)
        user = User.new(posx, posy, Const::USER_NAME)
        map.insert(user)
    end
    
    def generate_map(map)
        generate_drivers(map)
        generate_stores(map)
        generate_user(map)
    end


    def generate_path(src, dest, path_result)
        path_result << Struct.new(:x, :y).new(src.x, src.y)
        if Tool.position_same?(src, dest)
            return
        end

        deltax = dest.x - src.x
        if deltax > 0
            src.x += 1
            generate_path(src, dest, path_result)
        elsif deltax < 0
            src.x -= 1
            generate_path(src, dest, path_result)
        end

        deltay = dest.y - src.y
        if deltay > 0
            src.y += 1
            generate_path(src,dest,path_result)
        elsif deltay < 0
            src.y -= 1
            generate_path(src, dest, path_result)
        end
    end
end
