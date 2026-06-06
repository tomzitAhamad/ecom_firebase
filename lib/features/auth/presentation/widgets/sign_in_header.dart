import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
