import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int) onTabChange;
  const BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
      child: GNav(
        onTabChange: onTabChange,
        color: Colors.grey[400],
        activeColor: Colors.grey[700],
        // Use .shade300 because it's Color not Color?
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.white),
        mainAxisAlignment: MainAxisAlignment.center,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
