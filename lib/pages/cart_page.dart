import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/coffee.dart';
import 'package:coffee_shop/models/shop.dart';
import '../components/coffee_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    const Text(
                      'Your Cart',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Cart list
                    Expanded(
                      child: ListView.builder(
                          itemCount: value.userCart.length,
                          itemBuilder: (context, index) {
                            // Get individual coffee
                            Coffee coffee = value.userCart[index];

                            // Return coffee tile
                            return CoffeeTile(
                              coffee: coffee,
                              icon: const Icon(Icons.delete),
                              onPressed: () => value.removeItemFromCart(coffee),
                            );
                          }),
                    ),

                    const SizedBox(height: 25),

                    // Pay button
                    // Hide if cart is empty
                    value.userCart.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              double totalPrice = value.getCartTotalPrice;
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                      'Payment successful, your total is $totalPrice'),
                                ),
                              );

                              // Clear cart after get total price
                              value.clearCart();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  'Pay',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ));
  }
}
