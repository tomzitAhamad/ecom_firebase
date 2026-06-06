import 'package:ecom_firebase/features/home/data/models/product_model.dart';
import 'package:ecom_firebase/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;
  final VoidCallback onProductTap;

  const ProductGrid({
    super.key,
    required this.products,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return ProductCard(product: products[index], onTap: onProductTap);
        },
      ),
    );
  }
}
