import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tourapp/const/app_strings.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/ui/styles/styles.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(() => Get.toNamed(onboarding)),);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo/tour.png',
                height: 200.h,
              ),
              Text(AppStrings.appName, style: AppStyles().myTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
