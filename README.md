### SEA
#### Assumptions
1. Axis increasing left to right. Ordinate increasing up to down
2. Driver, Store, and User doesnt block path between driver to store or store to driver
3. View History is read from file that is saved when finishing order

#### Design Decision
There are one main program, 6 classes, and 4 modules.

Classes: PointObj, Driver, Store, User, Map, and Order
Module Tool, Finder, Generator, and Const

PointObj is parent class for Driver, Store, and User. because they all have position and name.
User class is basically PointObj class without any field or method added. it is used only for semantic (User) and probability of Open for Extension if there will be any changes in the future.
Map class is where all the business logic is implemented.
Order class is for order functionality.

Tool Module is toolwork for basic functionality other class to avoid DRY, in this case for POSITION related (out_of_bound?,out?, and position_same?), for Cost related (cost_of_order), and for rating related (rating_out?).

Finder Module is toolwork for anyting related to finding, in this case for finding driver for order.

Generator Module is toolwork for anything related to generating, in this case for generate position (random position), generate_drivers, generate_stores, generate_user, generate_map, and generate_path (for driver to store and store to user). 

Const Module is where all the CONST use in this program. i am doing this to localized all the constant in one place
