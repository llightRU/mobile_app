

enum FoodCategory{
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

class Addon{
  final String name;
  final double price;

  Addon({required this.name, required this.price});
}

class Food {
  final String name;              // cheese burger
  final String description;       // a burger full of cheese
  final String imagePath;         // assets/images/...
  final double price;             //4.99$
  final FoodCategory category;    //burger
  List<Addon> availableAddons;    //[extra cheeese, saunce,..]
  Food({required this.name, required this.description, required this.imagePath, required this.price,required this.category,required this.availableAddons});
}