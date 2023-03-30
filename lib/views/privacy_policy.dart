import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/views/widgets/violetButton.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 25,),
               VioletButton(
                  "Agree",
                  (){
                    Get.toNamed(bottomNav);
                  },
                ),
                SizedBox(height: 25.h,)
            ],
          ),
        ),

      ));
  }
}