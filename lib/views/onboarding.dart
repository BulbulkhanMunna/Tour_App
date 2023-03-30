import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourapp/const/app_colors.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/ui/styles/styles.dart';

class OnboardingScreen extends StatelessWidget {
  
    List<String> _lottieFiles = [
    'assets/files/welcome.json',
    'assets/files/categories.json',
    'assets/files/support.json',
  ];

  List<String> _title = [
    'welcome',
    'categories',
    'support',
  ];

  List<String> _description = [
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry\nLorem Ipsum is simply dummy text of the printing\nand typesetting industry.',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry\nLorem Ipsum is simply dummy text of the printing\nand typesetting industry.',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry\nLorem Ipsum is simply dummy text of the printing\nand typesetting industry.',
  ];

  RxInt _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: EdgeInsets.all(32.w),
          child: Column(
            children: [
              Obx(
                () => Expanded(
                    flex: 3,
                    child: Lottie.asset(_lottieFiles[_currentIndex.toInt()])),
              ),

              //Description....................
              Expanded(
                flex: 2,
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 10,
                          spreadRadius: 1.0),
                      BoxShadow(
                          color: Colors.greenAccent,
                          offset: Offset(-4.0, 4.0),
                          blurRadius: 5,
                          spreadRadius: 1.0),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            '${_title[_currentIndex.toInt()]}',
                            style: AppStyles().myTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => Text(
                            '${_description[_currentIndex.toInt()]}',
                          ),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //DotIndicator.........................
                            Obx(
                              () => DotsIndicator(
                                dotsCount: _lottieFiles.length,
                                position: _currentIndex.toDouble(),
                                decorator: DotsDecorator(
                                    size: Size(15, 15), color: Colors.blueGrey),
                              ),
                            ),

                            //Button...............................................
                            InkWell(
                              onTap: () {
                                if (_currentIndex == _title.length-1) {
                                  Get.toNamed(signup);
                                } else {
                                  _currentIndex + 1;
                                }
                              },
                              child: Container(
                                height: 37.h,
                                width: 37.w,
                                decoration: BoxDecoration(
                                  color: AppColors.scaffoldColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(4.0, 4.0),
                                        blurRadius: 10,
                                        spreadRadius: 1.0),
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4.0, 4.0),
                                        blurRadius: 5,
                                        spreadRadius: 1.0),
                                  ],
                                ),
                                child: Icon(Icons.arrow_forward_ios,),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      
    
      ),
    );
  }
}