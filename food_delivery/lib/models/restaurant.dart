import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/food.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
class Restaurant extends ChangeNotifier{
  final List<Food> _menu = [
    // Burgers
// Burger 1
    Food(
      name: "Classic Cheeseburger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/burgers/classic_cheeseburger.png",
      price: 2.50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.49),
        Addon(name: "Bacon", price: 0.99),
        Addon(name: "Avocado", price: 0.49),
      ],
    ),

// Burger 2
    Food(
      name: "Bacon BBQ Burger",
      description:
          "Beef patty with smoky BBQ sauce, crispy bacon, melted cheddar, and fried onion rings.",
      imagePath: "assets/images/burgers/bacon_burger.png",
      price: 3.00,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra BBQ sauce", price: 0.25),
        Addon(name: "Grilled onions", price: 0.49),
        Addon(name: "Jalapeños", price: 0.39),
      ],
    ),

// Burger 3
    Food(
      name: "Mushroom Swiss Burger",
      description:
          "Tender beef patty topped with Swiss cheese, sautéed mushrooms, and garlic aioli sauce.",
      imagePath: "assets/images/burgers/mushroom_burger.png",
      price: 3.20,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra mushrooms", price: 0.50),
        Addon(name: "Truffle mayo", price: 0.75),
        Addon(name: "Bacon", price: 0.99),
      ],
    ),

// Burger 4
    Food(
      name: "Spicy Jalapeño Burger",
      description:
          "Spicy beef patty with pepper jack cheese, jalapeños, lettuce, tomato, and sriracha mayo.",
      imagePath: "assets/images/burgers/spicy_burger.png",
      price: 3.10,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra jalapeños", price: 0.39),
        Addon(name: "Pepper jack cheese", price: 0.49),
        Addon(name: "Guacamole", price: 0.60),
      ],
    ),

// Burger 5
    Food(
      name: "Aloha Burger",
      description:
          "Beef patty with grilled pineapple, teriyaki sauce, lettuce, and Swiss cheese for a tropical twist.",
      imagePath: "assets/images/burgers/aloha_burger.png",
      price: 3.50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra pineapple", price: 0.30),
        Addon(name: "Teriyaki sauce", price: 0.25),
        Addon(name: "Bacon", price: 0.99),
      ],
    ),

// Desserts
// Dessert 1
    Food(
      name: "Chocolate Lava Cake",
      description:
          "A warm, decadent chocolate cake with a molten chocolate center, topped with vanilla ice cream.",
      imagePath: "assets/images/desserts/chocolate_lava_cake.png",
      price: 2.50,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra ice cream scoop", price: 1.00),
        Addon(name: "Whipped cream", price: 0.50),
      ],
    ),
// Dessert 2
    Food(
      name: "Strawberry Cheesecake",
      description:
          "Creamy cheesecake with a graham cracker crust, topped with fresh strawberries and strawberry sauce.",
      imagePath: "assets/images/desserts/strawberry_cheesecake.png",
      price: 5.00,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra strawberries", price: 0.75),
        Addon(name: "Chocolate drizzle", price: 0.50),
      ],
    ),
// Dessert 3
    Food(
      name: "Classic Tiramisu",
      description:
          "An Italian dessert made with coffee-soaked ladyfingers, mascarpone cream, and a dusting of cocoa powder.",
      imagePath: "assets/images/desserts/tiramisu.png",
      price: 2.50,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra cocoa dusting", price: 0.25),
        Addon(name: "Whipped cream", price: 0.50),
      ],
    ),
// Dessert 4
    Food(
      name: "Ice Cream Sundae",
      description:
          "Vanilla ice cream topped with hot fudge, whipped cream, nuts, and a cherry.",
      imagePath: "assets/images/desserts/ice_cream_sundae.png",
      price: 3.00,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra fudge", price: 0.50),
        Addon(name: "Chopped nuts", price: 0.30),
      ],
    ),
// Dessert 5
    Food(
      name: "Apple Pie",
      description:
          "Classic apple pie with a flaky crust, filled with spiced apples, and served with a scoop of vanilla ice cream.",
      imagePath: "assets/images/desserts/apple_pie.png",
      price: 4.00,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra ice cream scoop", price: 1.00),
        Addon(name: "Cinnamon sprinkle", price: 0.25),
      ],
    ),

// Salads
// Salad 1
    Food(
      name: "Caesar Salad",
      description:
          "Crisp romaine lettuce, crunchy croutons, and parmesan cheese tossed in a creamy Caesar dressing.",
      imagePath: "assets/images/salads/caesar_salad.png",
      price: 3.20,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.50),
        Addon(name: "Bacon bits", price: 1.00),
      ],
    ),

// Salad 2
    Food(
      name: "Greek Salad",
      description:
          "A mix of cucumbers, tomatoes, red onions, olives, and feta cheese, drizzled with olive oil and lemon juice.",
      imagePath: "assets/images/salads/greek_salad.png",
      price: 2.50,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra feta cheese", price: 1.50),
        Addon(name: "Olives", price: 0.75),
      ],
    ),

// Salad 3
    Food(
      name: "Garden Salad",
      description:
          "A fresh mix of lettuce, tomatoes, cucumbers, carrots, and bell peppers, topped with your choice of dressing.",
      imagePath: "assets/images/salads/garden_salad.png",
      price: 2.00,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Ranch dressing", price: 0.50),
        Addon(name: "Avocado slices", price: 1.25),
      ],
    ),

// Salad 4
    Food(
      name: "Cobb Salad",
      description:
          "A hearty salad with chicken, bacon, avocado, blue cheese, tomatoes, and hard-boiled eggs on a bed of greens.",
      imagePath: "assets/images/salads/cobb_salad.png",
      price: 5.00,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra chicken", price: 2.00),
        Addon(name: "Extra bacon", price: 1.50),
      ],
    ),

// Salad 5
    Food(
      name: "Spinach and Strawberry Salad",
      description:
          "Fresh spinach leaves paired with sweet strawberries, goat cheese, and candied pecans, dressed with balsamic vinaigrette.",
      imagePath: "assets/images/salads/spinach_strawberry_salad.png",
      price: 3.50,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled shrimp", price: 3.00),
        Addon(name: "Balsamic vinaigrette", price: 0.75),
      ],
    ),

// Sides
// Side 1
    Food(
      name: "Garlic Bread",
      description:
          "Crispy toasted bread topped with garlic butter and parsley, perfect for dipping.",
      imagePath: "assets/images/sides/garlic_bread.png",
      price: 1.00,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese topping", price: 0.50),
        Addon(name: "Extra butter", price: 0.50),
      ],
    ),

// Side 2
    Food(
      name: "French Fries",
      description:
          "Crispy golden fries, served with ketchup or your choice of dipping sauce.",
      imagePath: "assets/images/sides/french_fries.png",
      price: 1.50,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese sauce", price: 0.50),
        Addon(name: "Chili flakes", price: 0.25),
      ],
    ),

// Side 3
    Food(
      name: "Coleslaw",
      description:
          "Shredded cabbage and carrots mixed in a creamy dressing, a classic side dish.",
      imagePath: "assets/images/sides/coleslaw.png",
      price: 2.00,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra dressing", price: 0.50),
        Addon(name: "Bacon bits", price: 1.00),
      ],
    ),

// Side 4
    Food(
      name: "Onion Rings",
      description:
          "Crispy battered onion rings, served with a tangy dipping sauce.",
      imagePath: "assets/images/sides/onion_rings.png",
      price: 2.50,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Barbecue sauce", price: 0.75),
        Addon(name: "Spicy dipping sauce", price: 0.50),
      ],
    ),

// Side 5
    Food(
      name: "Mashed Potatoes",
      description:
          "Creamy mashed potatoes made with butter and cream, a comforting side dish.",
      imagePath: "assets/images/sides/mashed_potatoes.png",
      price: 1.50,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Gravy", price: 0.75),
        Addon(name: "Cheese", price: 1.00),
      ],
    ),

// Drinks
// Drink 1
    Food(
      name: "Iced Coffee",
      description:
          "Chilled brewed coffee served over ice with a splash of milk and a hint of sweetness.",
      imagePath: "assets/images/drinks/iced_coffee.png",
      price: 1.00,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Vanilla syrup", price: 0.50),
        Addon(name: "Extra shot of espresso", price: 1.00),
      ],
    ),

// Drink 2
    Food(
      name: "Lemonade",
      description:
          "Freshly squeezed lemon juice mixed with water and sugar, served over ice.",
      imagePath: "assets/images/drinks/lemonade.png",
      price: 1.00,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Mint leaves", price: 0.25),
        Addon(name: "Lemon slices", price: 0.50),
      ],
    ),

// Drink 3
    Food(
      name: "Smoothie",
      description:
          "A blend of fresh fruit, yogurt, and ice, creating a refreshing and healthy drink.",
      imagePath: "assets/images/drinks/smoothie.png",
      price: 1.60,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Protein powder", price: 1.00),
        Addon(name: "Chia seeds", price: 0.50),
      ],
    ),

// Drink 4
    Food(
      name: "Coca-Cola",
      description: "A classic carbonated soft drink, served cold.",
      imagePath: "assets/images/drinks/coca_cola.png",
      price: 0.50,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice cubes", price: 0.25),
        Addon(name: "Lime wedge", price: 0.50),
      ],
    ),

// Drink 5
    Food(
      name: "Hot Chocolate",
      description:
          "Rich and creamy hot chocolate topped with whipped cream and a sprinkle of cocoa powder.",
      imagePath: "assets/images/drinks/hot_chocolate.png",
      price: 2.00,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Marshmallows", price: 0.75),
        Addon(name: "Peppermint syrup", price: 0.50),
      ],
    ),
  ];

  // Getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  List<CartItem> _cart = [];

  // Operations
  // add to cart, remove, get total price, get total number of items, clear
  void addToCart(Food food, List<Addon> selectedAddons){
    CartItem? cartItem = _cart.firstWhereOrNull((item){
      bool isSameFood = item.food == food;

      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameAddons && isSameFood;
    });
    if(cartItem != null){
      cartItem.quantity++;
    }
    else{
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons)
      );
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cardItem){
    int cartIndex = _cart.indexOf(cardItem);

    if (cartIndex != -1){
      if (_cart[cartIndex].quantity >1){
        _cart[cartIndex].quantity--;
      } else{
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice(){
    double total = 0;
    for(CartItem cartItem in _cart){
      double itemTotal = cartItem.food.price;

      for(Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  int getTotalItemCount(){
    int totalItemCount = 0;
    for(CartItem cartItem in _cart){
      totalItemCount +=cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart(){
    _cart.clear();
    notifyListeners();
  }
  // Helpers
  // generate a receipt, format double value into money, format list of addons into a string summary
  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("------------");
    for (final cartItem in _cart){
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.totalPrice)}"
      );
      receipt.writeln(
        "\t\t${cartItem.food.name}  (${_formatPrice(cartItem.food.price*cartItem.quantity)})"
      );
      if (cartItem.selectedAddons.isNotEmpty){
        receipt.writeln("\t\tAdd-ons: ${_formatAddons(cartItem.selectedAddons,cartItem.quantity)}");
      }
      receipt.writeln();
    }

    receipt.writeln("------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }
  String _formatPrice(double price){
    return "\$${price.toStringAsFixed(2)}";
  }
  String _formatAddons(List<Addon> addons, int quantity){
    return addons.map((addon)=> "${addon.name} (${_formatPrice(addon.price*quantity)})").join("\n\t\t");
  }
}
