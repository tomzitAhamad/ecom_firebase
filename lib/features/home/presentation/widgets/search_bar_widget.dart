import 'package:ecom_firebase/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6.r),
                bottomLeft: Radius.circular(6.r),
              ),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Search products here",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Container(
          height: 48.h,
          width: 48.w,
          color: AppColors.deepOrange,
          child: const Icon(Icons.search, color: Colors.white),
        ),
      ],
    );
  }
}
