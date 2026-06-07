import 'package:ecom_firebase/features/home/data/dummy/dummy_products.dart';
import 'package:ecom_firebase/features/home/data/models/product_model.dart';
import 'package:ecom_firebase/features/home/presentation/widgets/banner_slider.dart';
import 'package:ecom_firebase/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:ecom_firebase/features/home/presentation/widgets/home_header.dart';
import 'package:ecom_firebase/features/home/presentation/widgets/product_grid.dart';
import 'package:ecom_firebase/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:ecom_firebase/features/home/presentation/widgets/section_header.dart';
import 'package:ecom_firebase/features/product/presentation/screens/product_details_screen.dart';
import 'package:ecom_firebase/features/product/presentation/screens/product_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HomeHeader(),

                SizedBox(height: 20.h),

                const SearchBarWidget(),

                SizedBox(height: 20.h),

                const BannerSlider(),

                SizedBox(height: 25.h),

                /// Top Products
                SectionHeader(
                  title: "Top Products",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const ProductListingScreen(title: "Top Products"),
                      ),
                    );
                  },
                ),

                SizedBox(height: 15.h),

                ProductGrid(
                  products: topProducts,
                  onProductTap: (ProductModel product) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsScreen(product: product),
                      ),
                    );
                  },
                ),

                SizedBox(height: 25.h),

                /// Accessories
                SectionHeader(
                  title: "Accessories",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const ProductListingScreen(title: "Accessories"),
                      ),
                    );
                  },
                ),

                SizedBox(height: 15.h),

                ProductGrid(
                  products: accessories,
                  onProductTap: (ProductModel product) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsScreen(product: product),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
