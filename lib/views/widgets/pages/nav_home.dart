import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/views/widgets/na_home_categories.dart';

class NavHome extends StatefulWidget {
  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            AspectRatio(aspectRatio: 3.0),
            navHomeCategories('For You', () => Get.toNamed(seeALLScreen)),
            SizedBox(
              height: 5.h,
            ),
            forYou(),
            SizedBox(
              height: 5.h,
            ),
            navHomeCategories('Recently Added', () {}),
            SizedBox(
              height: 5.h,
            ),
            recentlyAdded(),
            SizedBox(
              height: 5.h,
            ),
            navHomeCategories('Top Places', () {}),
            SizedBox(
              height: 5.h,
            ),
            topPlaces(),
          ],
        ),
      ),
    );
  }
}

Widget forYou() {
  return Container(
    height: 180.h,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: InkWell(
              onTap: () => Get.toNamed(detailsScreen),
              child: Container(
                width: 100.w,
                height: 180.h,
                decoration: BoxDecoration(
                  color: Color(0xFfC4C4C4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.r),
                        topRight: Radius.circular(7.r),
                      ),
                      child: Image.asset(
                        "assets/images/ifel.jpg",
                        height: 115.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "Tittle",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    Text(
                      "Cost",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
            ),
          );
        })),
  );
}

Widget recentlyAdded() {
  return Container(
    height: 180.h,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: ((context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: InkWell(
            onTap: () => Get.toNamed(detailsScreen),
            child: Container(
              width: 100.w,
              height: 180.h,
              decoration: BoxDecoration(
                color: Color(0xFfC4C4C4),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7.r),
                      topRight: Radius.circular(7.r),
                    ),
                    child: Image.asset(
                      "assets/images/arm.jpeg",
                      height: 115.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "Tittle",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Text(
                    "Cost",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    ),
  );
}

Widget topPlaces() {
  return Container(
    height: 180.h,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: InkWell(
              onTap: () => Get.toNamed(detailsScreen),
              child: Container(
                width: 100.w,
                height: 180.h,
                decoration: BoxDecoration(
                  color: Color(0xFfC4C4C4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.r),
                        topRight: Radius.circular(7.r),
                      ),
                      child: Image.asset(
                        "assets/images/swis.jpg",
                        height: 115.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "Tittle",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    Text(
                      "Cost",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
            ),
          );
        })),
  );
}
