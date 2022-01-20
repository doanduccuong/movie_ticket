import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_ticket/configs/colors.dart';
Widget BookingPart(){
  return Container(
    width: 330.w,
    height: 315.h,
    child: Column(
      children: [
        for(int i=0;i<8;i++)
          Row(
            children: [
              for(int j=0;i<9;j++)
                Container(
                  height: 27.h,
                  width: 27.w,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: AppColors.textColor),
                    borderRadius: BorderRadius.circular(5.r)
                  ),
                )
            ],
          )
      ],
    ),
  );
}