module Tool
    extend self
    # attr_accessor :MENU1
    MENU1 = "dict" 
    # def out?(pos_x, pos_y, obj, size)
    #     raise "#{obj.class} position is out of bound" if outp(pos_x, size) || outp(pos_y, size) 
    # end

    # def out_of_bound?(pos)

    # end

    def out?(pos, size)
        # puts "pos #{pos}, size #{size}"
        # puts "pos < 0 && pos >= size", pos < 0 && pos >= size
        pos < 0 || pos >= size
    end

    def wew(name)
        "#{name} woi woi"
    end



    def delete_driver(drivers)
        drivers.delete_if { |driver| !driver.first_time && driver.rating < 3.0 }
    end

    # def delete_test(objs)
    #     objs.delete_if {|obj| obj.rating < 3  }
    # end

end

