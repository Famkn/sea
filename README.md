### SOFTWARE ENGINEERING ACADEMY
### COMPFEST - GOJEK
### SECOND STAGE ASSIGNMENT

#### Assumptions
1. Axis increasing left to right. Ordinate increasing up to down
2. Driver, Store, and User doesnt block path between driver to store or store to driver
3. View History is read from file that is saved when finishing order

#### Design Decision
There are one main program, 5 classes, and 5 modules.

Classes: PointObj, Driver, Store, User, and Map.

Module Order, Tool, Finder, Generator, and Const

PointObj is parent class for Driver, Store, and User. I use inheritance to reuse code because they all have position and name.
User class is basically PointObj class without any field or method added. it is used only for semantic (User) for readability.
Driver class is class that act like driver in spesification.
Store class is class that act like store in spesification.
Map class is class that act like map object in real life that have information of driver, store, and user. 

Tool Order is toolwork for order related functionality. this is where the logic for order functionality implemented. (order and view history order).

Tool Module is toolwork for basic functionality for other class to avoid DRY, in this case for position related (out_of_bound?,out?, and position_same?), for Cost related (cost_of_order), and for rating related (rating_out?).

Finder Module is toolwork for anyting related to finding, in this case for finding driver for order.

Generator Module is toolwork for anything related to generating, in this case for generate position (random position), generate_drivers, generate_stores, generate_user generate_map, and generate_path (for driver to store and store to user). 

Const Module is where all the CONST use in this program. i am doing this to localized all the constant in one place

[Repository](https://github.com/famkampm/sea)
