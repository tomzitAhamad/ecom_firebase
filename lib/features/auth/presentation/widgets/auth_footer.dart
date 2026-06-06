import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class AuthFooter extends StatelessWidget {
  final VoidCallback onTap;

  const AuthFooter({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),

        GestureDetector(
          onTap: onTap,
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: AppColors.deepOrange,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
