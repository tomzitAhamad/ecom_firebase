import 'package:ecom_firebase/core/constants/app_colors.dart';
import 'package:ecom_firebase/features/home/data/models/product_model.dart';
import 'package:ecom_firebase/features/wishlist/presentation/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SelectedProductCartScreen extends StatefulWidget {
  final ProductModel product;

  const SelectedProductCartScreen({super.key, required this.product});

  @override
  State<SelectedProductCartScreen> createState() =>
      _SelectedProductCartScreenState();
}

class _SelectedProductCartScreenState extends State<SelectedProductCartScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    double subtotal = product.price * quantity;
    double shipping = 10;
    double total = subtotal + shipping;

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

      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            /// Product Card
            Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  /// Product Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.r),
                    child: Image.network(
                      product.images.first,
                      width: 90.w,
                      height: 90.h,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 14.w),

                  /// Product Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8.h),

                        Text(
                          "\$${product.price.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.deepOrange,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        SizedBox(height: 12.h),

                        /// Quantity Buttons
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (quantity > 1) {
                                    setState(() {
                                      quantity--;
                                    });
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 14.r,
                                  backgroundColor: AppColors.deepOrange,
                                  child: Icon(
                                    Icons.remove,
                                    size: 16.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              SizedBox(width: 14.w),

                              Text(
                                quantity.toString(),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(width: 14.w),

                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 14.r,
                                  backgroundColor: AppColors.deepOrange,
                                  child: Icon(
                                    Icons.add,
                                    size: 16.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            /// Bottom Price Section
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.r),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8.r)],
              ),
              child: Column(
                children: [
                  _priceRow("Subtotal", "\$${subtotal.toStringAsFixed(2)}"),

                  SizedBox(height: 10.h),

                  _priceRow("Shipping", "\$${shipping.toStringAsFixed(2)}"),

                  Divider(height: 30.h),

                  _priceRow(
                    "Total",
                    "\$${total.toStringAsFixed(2)}",
                    isBold: true,
                  ),

                  SizedBox(height: 24.h),

                  SizedBox(
                    width: double.infinity,
                    height: 55.h,
                    child: ElevatedButton(
                      onPressed: () {
                        product.quantity = quantity;

                        context.read<WishlistProvider>().addToWishlist(product);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${product.name} added to wishlist"),
                          ),
                        );

                        Navigator.pop(context);
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
