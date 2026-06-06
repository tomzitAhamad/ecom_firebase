import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Ecommerce",
        style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}
