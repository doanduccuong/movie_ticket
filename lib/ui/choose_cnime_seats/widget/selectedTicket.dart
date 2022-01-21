import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_ticket/configs/colors.dart';
Widget SelectedTicket(){
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: 5.5.w, vertical: 5.5.h),
    width: 27.h,
    height: 27.h,
    decoration: BoxDecoration(
      color: AppColors.selectedboxColor,
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(5.r),
    ),
  );
}