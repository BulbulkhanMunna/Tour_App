import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tourapp/const/app_colors.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/ui/styles/styles.dart';
import 'package:tourapp/views/widgets/violetButton.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 80.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login\nTo Your Account',
                  style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.violetColor),
                ),

                SizedBox(
                  height: 80.h,
                ),

                //text form...............................................
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: AppStyles().TextFieldDecoration("Email Address"),
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: AppStyles().TextFieldDecoration("Enter Password"),
                ),
                SizedBox(
                  height: 40.h,
                ),
                VioletButton("Login", () {
                  SignIn();
                }),

                SizedBox(
                  height: 15.h,
                ),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '--OR--',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),

                //fb or google...................................................
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Transform.scale(
                          scale: 0.9,
                          child: Image.asset(
                            'assets/icons/fb.png',
                          )),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Transform.scale(
                        scale: 0.9,
                        child: Image.asset(
                          'assets/icons/google.png',
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 15.h,
                ),

                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Don’t have registered yet? ',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.violetColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(signup),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
