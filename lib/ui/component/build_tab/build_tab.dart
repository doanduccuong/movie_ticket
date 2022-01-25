import 'package:flutter/material.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTab extends StatelessWidget {
  BuildTab({required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Tab(
        iconMargin: EdgeInsets.zero,
        height: 22.h,
        child: TextNormal(
          title: title,
          size: 13.sp,
          height: 1.5.h,
        ),
      ),
      height: 22.h,
      decoration: BoxDecoration(
        color: AppColors.selectedboxColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
    );
  }
}
