module Tool
    extend self
    
    def out_of_bound?(pos, size)
        out?(pos.x, size) || out?(pos.y, size)
    end

    def out?(pos, size)
        pos < 0 || pos >= size
    end

    def delete_driver(drivers)
        drivers.delete_if { |driver| !driver.first_time && driver.rating < 3.0 }
    end

    def position_same?(src, dst)
        src.x == dst.x && src.y == dst.y
    end
    
end

