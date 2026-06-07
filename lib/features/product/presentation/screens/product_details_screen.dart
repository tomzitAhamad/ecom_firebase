import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_firebase/core/constants/app_colors.dart';
import 'package:ecom_firebase/features/cart/presentation/screens/cart_screen.dart';
import 'package:ecom_firebase/features/home/data/models/product_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: const Color(0xffF7FAF8),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.deepOrange,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),

                  CircleAvatar(
                    backgroundColor: AppColors.deepOrange,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),

              /// Image Carousel
              CarouselSlider.builder(
                itemCount: product.images.length,
                itemBuilder: (context, index, realIndex) {
                  return Center(
                    child: Image.network(
                      product.images[index],
                      height: 250.h,
                      fit: BoxFit.contain,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 260.h,
                  viewportFraction: 1,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),

              SizedBox(height: 15.h),

              /// Dots Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  product.images.length,
                  (index) => _dot(currentIndex == index),
                ),
              ),

              SizedBox(height: 30.h),

              /// Product Name
              Text(
                product.name,
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15.h),

              /// Price
              Text(
                "\$${product.price}",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 25.h),

              /// Description
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 16.sp,
                  height: 1.8,
                  color: Colors.grey.shade700,
                ),
              ),

              const Spacer(),

              /// Add to Cart Button
              SizedBox(
                width: double.infinity,
                height: 55.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CartScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dot(bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      width: active ? 20.w : 8.w,
      height: 8.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: active ? AppColors.deepOrange : Colors.grey.shade300,
      ),
    );
  }
}
