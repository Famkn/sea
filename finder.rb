require_relative "const"


module Finder
    extend self

    def find_driver(drivers, store)
        nearest_cost = Const::FIXNUM_MAX
        nearest_driver = nil
        for driver in drivers 
            deltax = driver.position.x - store.position.x
            deltay = driver.position.y - store.position.y
            cost = deltax.abs + deltay.abs
            if cost < nearest_cost
                nearest_cost = cost
                nearest_driver = driver
            end
        end
        nearest_driver
    end

end