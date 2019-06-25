module Const
    extend self

    # MENU
    MENU1 = {"ayam_goreng" => 15, "nasi_goreng" => 10, "seblak" => 10, "seafood" => 25}
    MENU2 = {"pasta" => 40, "pizza" => 70, "burger" => 20}
    MENU3 = {"kopi" => 1, "indomie" => 3, "pempek" => 5, "batagor" => 8}
    MENU = [MENU1, MENU2, MENU3]

    # DRIVERNAME ascii
    DRIVER_NAME = 65

    # MAXIMUM NUMBER
    FIXNUM_MAX = (2**(0.size * 8 -2) -1)

    # MINIMUM NUMBER
    FIXNUM_MIN = -(2**(0.size * 8 -2))

    # COST OF UNIT
    UNITCOST = 100

    # RATING
    MINIMUM_RATING = 1
    MAXIMUM_RATING = 5

    #USER NAME
    USER_NAME = "U"
    
    # FILENAME
    FILENAME = "history.txt"
end