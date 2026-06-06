import 'package:ecom_firebase/core/constants/app_colors.dart';
import 'package:ecom_firebase/features/auth/presentation/screens/signup_screen.dart';
import 'package:ecom_firebase/features/auth/presentation/widgets/auth_button.dart';
import 'package:ecom_firebase/features/auth/presentation/widgets/auth_footer.dart';
import 'package:ecom_firebase/features/auth/presentation/widgets/auth_header.dart';
import 'package:ecom_firebase/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:ecom_firebase/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepOrange,
      body: Column(
        children: [
          const AuthHeader(title: "Sign In"),

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
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.deepOrange,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "Glad to see you back my buddy.",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),

                    SizedBox(height: 40.h),

                    AuthTextField(
                      label: "Email",
                      hint: "johndoe@gmail.com",
                      icon: Icons.email_outlined,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    SizedBox(height: 25.h),

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

                    AuthButton(
                      title: "SIGN IN",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                        );
                      },
                    ),

                    SizedBox(height: 30.h),

                    AuthFooter(
                      questionText: "Don't have an account? ",
                      actionText: "Sign Up",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignupScreen(),
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
