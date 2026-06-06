import 'package:ecom_firebase/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SectionHeader({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),

        GestureDetector(
          onTap: onTap,
          child: const Text(
            "View All",
            style: TextStyle(color: AppColors.deepOrange),
          ),
        ),
      ],
    );
  }
}
