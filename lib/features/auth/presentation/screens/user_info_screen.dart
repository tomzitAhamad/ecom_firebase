import 'package:ecom_firebase/core/constants/app_colors.dart';
import 'package:ecom_firebase/features/auth/presentation/screens/login_screen.dart';
import 'package:ecom_firebase/features/auth/presentation/widgets/auth_button.dart';
import 'package:ecom_firebase/features/auth/presentation/widgets/auth_header.dart';
import 'package:ecom_firebase/features/auth/presentation/widgets/auth_textfield.dart';

import 'package:ecom_firebase/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepOrange,
      body: Column(
        children: [
          const AuthHeader(title: "User Info"),

          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(30.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Complete Profile",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.deepOrange,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "Provide your information.",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),

                    SizedBox(height: 40.h),

                    AuthTextField(
                      label: "Phone",
                      hint: "+8801XXXXXXXXX",
                      icon: Icons.phone_outlined,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                    ),

                    SizedBox(height: 25.h),

                    AuthTextField(
                      label: "Address",
                      hint: "Dhaka, Bangladesh",
                      icon: Icons.location_on_outlined,
                      controller: addressController,
                    ),

                    SizedBox(height: 50.h),

                    AuthButton(
                      title: "DONE",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
