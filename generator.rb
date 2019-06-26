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

    def generate_drivers(map, drivers_position = nil, num_drivers = nil)
        if drivers_position == nil && num_drivers == nil
            for i in 0...5 do
                posx, posy = generate_position(map.size)
                driver = Driver.new(posx, posy, (Const::DRIVER_NAME + i).chr)
                map.insert(driver)
            end
        else
            for i in 0...num_drivers do
                posx, posy = drivers_position[i].x, drivers_position[i].y
                driver = Driver.new(posx, posy, (Const::DRIVER_NAME + i).chr)
                map.insert(driver)
            end
        end
    end

    def generate_stores(map, stores = nil)
        if stores == nil
            for i in 0..2 do
                posx, posy = generate_position(map.size)
                store = Store.new(posx, posy, i.to_s, Const::MENU[i])
                map.insert(store)
            end
        else 
            stores.each {|store| map.insert(store)}
        end
        
    end

    def generate_user(map, user_position = nil)
        posx = nil; posy = nil
        if user_position == nil
            posx, posy = generate_position(map.size)
        else 
            posx, posy = user_position.x.to_i, user_position.y.to_i    
        end
        user = User.new(posx, posy, Const::USER_NAME)
        map.insert(user)
    end
    
    def generate_map(map, drivers_position = nil, num_drivers = nil, num_store = nil, stores = nil, user_position = nil)
        generate_drivers(map, drivers_position, num_drivers)
        generate_stores(map, stores)
        generate_user(map, user_position)
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
