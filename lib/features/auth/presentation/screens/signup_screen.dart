import 'package:ecom_firebase/core/constants/app_colors.dart';
import 'package:ecom_firebase/features/auth/presentation/widgets/auth_button.dart';
import 'package:ecom_firebase/features/auth/presentation/widgets/auth_footer.dart';
import 'package:ecom_firebase/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:ecom_firebase/features/auth/presentation/widgets/sign_in_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscureText = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepOrange,
      body: Column(
        children: [
          const SignInHeader(),

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
                      "Create Account",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.deepOrange,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "Create a new account to continue.",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),

                    SizedBox(height: 40.h),

                    /// Name
                    AuthTextField(
                      label: "Full Name",
                      hint: "John Doe",
                      icon: Icons.person_outline,
                      controller: nameController,
                    ),

                    SizedBox(height: 25.h),

                    /// Email
                    AuthTextField(
                      label: "Email",
                      hint: "johndoe@gmail.com",
                      icon: Icons.email_outlined,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    SizedBox(height: 25.h),

                    /// Password
                    AuthTextField(
                      label: "Password",
                      hint: "••••••••",
                      icon: Icons.lock_outline,
                      controller: passwordController,
                      obscureText: obscureText,
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: Icon(
                          obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),

                    SizedBox(height: 50.h),

                    AuthButton(title: "SIGN UP", onTap: () {}),

                    SizedBox(height: 30.h),

                    AuthFooter(
                      questionText: "Already have an account? ",
                      actionText: "Sign In",
                      onTap: () {
                        Navigator.pop(context);
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
