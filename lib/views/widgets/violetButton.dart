import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tourapp/const/app_colors.dart';

class VioletButton extends StatelessWidget {

   String title;
  final Function onAction;
  VioletButton(this.title,this.onAction);

  RxBool _value = false.obs;
  

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          _value.value = true;
          onAction();
        },
        //button.................................
        child: Container(
          height: 45.h,
          decoration: BoxDecoration(
            color: AppColors.violetColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5.r),
            ),
          ),
          child: _value == false
              ? Center(
                  child: Text(
                    //create account text
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                        color: Colors.white),
                  ),
                )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Please Wait',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.sp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Transform.scale(
                      scale: 0.5,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}