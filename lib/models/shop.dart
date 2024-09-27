import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  // Coffee items list
  final List<Coffee> _coffeeList = [
    Coffee(
      name: 'Long Black',
      price: "4.10",
      image: "assets/images/black.png",
    ),
    Coffee(
      name: 'Latte',
      price: "4.20",
      image: "assets/images/latte.png",
    ),
    Coffee(
      name: 'Espresso',
      price: "3.50",
      image: "assets/images/espresso.png",
    ),
    Coffee(
      name: 'Iced Coffee',
      price: "4.40",
      image: "assets/images/iced_coffee.png",
    ),
  ];

  // User's cart
  final List<Coffee> _userCart = [];

  // Get coffee items list
  List<Coffee> get coffeeList => _coffeeList;

  // Get user's cart
  List<Coffee> get userCart => _userCart;

  // Add coffee item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // Remove coffee item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  double get getCartTotalPrice =>
      _userCart.fold(0, (total, coffee) => total + double.parse(coffee.price));

  // Clear user's cart when pay button is pressed
  void clearCart() {
    _userCart.clear();
    notifyListeners();
  }
}
