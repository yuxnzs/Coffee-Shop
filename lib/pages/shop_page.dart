import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/models/shop.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/components/coffee_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Text(
              'What would you like to buy?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            // List of coffee
            Expanded(
              child: Consumer<CoffeeShop>(builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.coffeeList.length,
                  itemBuilder: (context, index) {
                    // Get individual coffee
                    Coffee coffee = value.coffeeList[index];

                    // Return coffee tile
                    return CoffeeTile(
                      coffee: coffee,
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        value.addItemToCart(coffee);

                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Text('Successfully added to cart'),
                          ),
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
