module Const
    extend self

    # MENU
    MENU1 = {"ayam goreng" => 15000, "nasi goreng" => 10000, "seblak" => 10000, "seafood" => 25000}
    MENU2 = {"pasta" => 40000, "pizza" => 70000, "burger" => 20000}
    MENU3 = {"kopi" => 1000, "indomie" => 3000, "pempek" => 5000, "batagor" => 8000}
    MENU = [MENU1, MENU2, MENU3]

    # DRIVERNAME ascii
    DRIVER_NAME = 65

    # MAXIMUM NUMBER
    FIXNUM_MAX = (2**(0.size * 8 -2) -1)

    # MINIMUM NUMBER
    FIXNUM_MIN = -(2**(0.size * 8 -2))


end