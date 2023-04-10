import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget detailsHeadingDescription(tittle,decription){
  return Padding(
    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tittle,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        Text(
          decription,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    ),
  );

}