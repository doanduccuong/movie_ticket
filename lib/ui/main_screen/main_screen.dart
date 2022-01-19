
import 'package:flutter/material.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/configs/constant.dart';
import 'package:movie_ticket/configs/images.dart';
import 'package:movie_ticket/ui/component/text/text_bold.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextNormal(
                title: 'Allmovies',
                size: 15.sp,
                height: 15.h,
              ),
              TextNormal(
                title: 'Forkids',
                size: 15.sp,
                height: 15.h,
              ),
              TextNormal(
                title: 'My Tickets',
                size: 15.sp,
                height: 15.h,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, bottom: 8.h),
            child: TextBold(title: 'Coming Soon', size: 22.sp, height: 1.5.h),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            padding: EdgeInsets.only(left: 15.w, right: 16.w, bottom: 164.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextNormal(
                  title: 'The Batman',
                  size: 15.sp,
                  height: 1.5.h,
                ),
                Icon(
                  Icons.share,
                  size: 20.sp,
                  color: AppColors.textColor,
                )
              ],
            ),
            width: 320.w,
            height: 220.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                    image: AssetImage(AppImages.imgBatman), fit: BoxFit.cover)),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w, top: 25.h),
            height: 22.h,
            width: double.infinity,
            child: ListView.builder(
              itemCount: Constants.texts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  child: TextNormal(
                    title: Constants.texts[index],
                    size: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  margin: EdgeInsets.only(right: 17.w),
                  width: 50.w,
                  height: 22.h,
                  decoration: BoxDecoration(
                    color: AppColors.boxColor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 28.w, left: 30.w, bottom: 17.h),
            child: TextBold(title: 'Now Showing', size: 22.sp, height: 1.5.h),
          ),
          Container(
            width: 177.6.w,
            height: 242.52.h,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppImages.imgSpiderman),fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10.r)
            ),
          )
        ],
      ),
    );
  }
}
