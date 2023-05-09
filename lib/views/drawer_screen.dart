import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:tourapp/const/app_strings.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/views/widgets/drawer_item.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 50.h, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.appName,
              style: TextStyle(fontSize: 32.w, fontWeight: FontWeight.w500),
            ),
            Text(
              'Travel Agency',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20.h,
            ),
            drawerItem(
              "Support",
              () => Get.toNamed(supportScreen),
            ),
            drawerItem(
              "Privacy",
              () => Get.toNamed(privacyScreen),
            ),
            drawerItem(
              "FAQ",
              () => Get.toNamed(faqScreen),
            ),
            drawerItem("Rate Us", () {
              LaunchReview.launch(
                androidAppId: "com.example.tourapp"
                
              );
            }),
            drawerItem(
              "How to use",
              () => Get.toNamed(howtoUseScreen),
            ),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () =>Get.toNamed(settingsScreen),
              child: Text(
                "Settings",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
