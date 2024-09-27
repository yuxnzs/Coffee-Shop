import 'package:coffee_shop/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import '../const.dart';
import 'shop_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Navigate through bottom tabs
  int _selectedIndex = 0;

  void navigateBottomTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Pages
  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavBar(
        onTabChange: navigateBottomTab,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
