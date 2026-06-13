import 'package:ecom_firebase/core/constants/app_colors.dart';
import 'package:ecom_firebase/core/providers/bottom_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, navProvider, _) {
        return BottomNavigationBar(
          currentIndex: navProvider.currentIndex,

          onTap: (index) {
            navProvider.changeIndex(index);
          },

          type: BottomNavigationBarType.fixed,

          selectedItemColor: AppColors.deepOrange,

          unselectedItemColor: Colors.grey,

          showSelectedLabels: false,

          showUnselectedLabels: false,

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),

            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),

            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),

            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        );
      },
    );
  }
}
