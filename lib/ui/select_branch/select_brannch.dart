
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/configs/images.dart';
import 'package:movie_ticket/ui/component/reuse_card/reuse_card.dart';
import 'package:movie_ticket/ui/component/text/text_bold.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';

class SelectBrand extends StatelessWidget {
  const SelectBrand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.w, top: 58.h, bottom: 20.h),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: AppColors.textColor,
                  size: 30.sp,
                ),
                SizedBox(
                  width: 9.w,
                ),
                TextNormal(
                  title: 'Seclect Branch',
                  size: 15.sp,
                  height: 1.5.h,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 34.h),
            child: TextFormField(
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.share,
                    color: AppColors.ePrimaryColor,
                    size: 20.sp,
                  ),
                  prefixIcon: Icon(Icons.search,
                      color: AppColors.ePrimaryColor, size: 20.sp),
                  hintText: 'Search Malls or Branch',
                  hintStyle: TextStyle(
                    color: AppColors.ePrimaryColor,
                    fontSize: 13.sp,
                    height: 1.5.h,
                  )),
            ),
            width: 330.w,
            height: 49.h,
            decoration: BoxDecoration(
                color: AppColors.hPrimaryColor,
                borderRadius: BorderRadius.circular(25.r)),
          ),
          Padding(
            padding: EdgeInsets.only(right: 301.w, left: 34.w, bottom: 29.h),
            child: TextNormal(
              title: 'Nearby',
              size: 16.sp,
              height: 1.5.h,
            ),
          ),
          ReUseCard(
            image: AppImages.imgMaskGroup,
            cinemasNumber: 3,
            locationName: 'SM City Marikina',
            startNumber: 4.9,
          ),
          Container(
            margin: EdgeInsets.only(
                top: 47.h, right: 273.w, left: 30.w, bottom: 29.h),
            child: TextBold(title: 'Suggested', size: 16.sp, height: 1.5.h),
          ),
          ReUseCard(
            image: AppImages.imgMaskGroup1,
            cinemasNumber: 3,
            locationName: 'Glorietta 4 - Makati',
            startNumber: 4.6,
          ),
          Container(
            margin: EdgeInsets.only(top: 34.h),
            child: ReUseCard(
              image: AppImages.imgMaskGroup2,
              cinemasNumber: 6,
              locationName: 'UP Town Center Mall',
              startNumber: 4.9,
            ),
          ),
        ],
      ),
    );
  }
}
