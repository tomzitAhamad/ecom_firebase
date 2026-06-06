import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType keyboardType;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.obscureText = false,
    this.suffix,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: AppColors.deepOrange,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(icon, color: Colors.white, size: 22.sp),
        ),

        SizedBox(width: 16.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label.toUpperCase(),
                style: TextStyle(
                  color: AppColors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      keyboardType: keyboardType,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hint,
                      ),
                    ),
                  ),

                  if (suffix != null) suffix!,
                ],
              ),

              Divider(color: Colors.grey.shade300),
            ],
          ),
        ),
      ],
    );
  }
}
