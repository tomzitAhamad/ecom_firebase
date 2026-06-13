import 'package:ecom_firebase/core/providers/bottom_nav_provider.dart';
import 'package:ecom_firebase/features/cart/presentation/screens/cart_screen.dart';
import 'package:ecom_firebase/features/home/presentation/screens/home_screen.dart';
import 'package:ecom_firebase/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:ecom_firebase/features/profile/presentation/screens/profile_screen.dart';
import 'package:ecom_firebase/features/wishlist/presentation/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<BottomNavProvider>(context);

    final screens = [
      const HomeScreen(),
      const WishlistScreen(),
      const CartScreen(fromBottomNav: true),
      // const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[navProvider.currentIndex],

      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
