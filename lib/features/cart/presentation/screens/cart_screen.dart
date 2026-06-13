import 'package:ecom_firebase/core/constants/app_colors.dart';
import 'package:ecom_firebase/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecom_firebase/features/wishlist/presentation/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7FAF8),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: CircleAvatar(
            backgroundColor: AppColors.deepOrange,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ),
      ),

      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.cartItems.isEmpty) {
            return Center(
              child: Text(
                "Your Cart is Empty",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cartProvider.cartItems.length,
                    separatorBuilder: (_, __) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final item = cartProvider.cartItems[index];

                      return Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 6.r),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.network(
                                item.product.images.first,
                                width: 80.w,
                                height: 80.h,
                                fit: BoxFit.cover,
                              ),
                            ),

                            SizedBox(width: 12.w),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.product.name,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 8.h),

                                  Text(
                                    "\$${item.product.price}",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: AppColors.deepOrange,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    cartProvider.increaseQuantity(index);
                                  },
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: AppColors.deepOrange,
                                  ),
                                ),

                                Text(
                                  item.quantity.toString(),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    cartProvider.decreaseQuantity(index);
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: AppColors.deepOrange,
                                  ),
                                ),
                              ],
                            ),

                            IconButton(
                              onPressed: () {
                                cartProvider.removeItem(index);
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    children: [
                      _priceRow(
                        "Subtotal",
                        "\$${cartProvider.totalPrice.toStringAsFixed(2)}",
                      ),

                      SizedBox(height: 12.h),

                      _priceRow("Shipping", "\$10.00"),

                      Divider(height: 30.h),

                      _priceRow(
                        "Total",
                        "\$${(cartProvider.totalPrice + 10).toStringAsFixed(2)}",
                        isBold: true,
                      ),

                      SizedBox(height: 20.h),

                      SizedBox(
                        width: double.infinity,
                        height: 55.h,
                        child: ElevatedButton(
                          onPressed: () {
                            final wishlistProvider =
                                Provider.of<WishlistProvider>(
                                  context,
                                  listen: false,
                                );

                            for (var item in cartProvider.cartItems) {
                              wishlistProvider.addToWishlist(item.product);
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Added to Wishlist"),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.deepOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                          ),
                          child: Text(
                            "ADD TO WISHLIST",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _priceRow(String title, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isBold ? 18.sp : 15.sp,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 18.sp : 15.sp,
            fontWeight: FontWeight.bold,
            color: isBold ? AppColors.deepOrange : Colors.black,
          ),
        ),
      ],
    );
  }
}
