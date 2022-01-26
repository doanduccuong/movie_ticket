import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/configs/images.dart';
import 'package:movie_ticket/ui/component/text/text_bold.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';
class ReUseCard extends StatelessWidget {
  ReUseCard({Key? key, required this.image,required this.cinemasNumber,required this.locationName, required this.startNumber}) : super(key: key);
  String image;
  double startNumber;
  int cinemasNumber;
  String locationName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 13.w,),
            width: 113.w,
            height: 113.h,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)
            ),

          ),
          Container(
            margin: EdgeInsets.only(top: 14.h,right: 40.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBold(title: locationName, size: 13.sp, height: 1.5.h),
                Container(
                  margin: EdgeInsets.only(top: 17.h,bottom: 3.h),
                  child: Row(
                    children: [
                      Image.asset(AppImages.imgTicket),
                      SizedBox(width: 7.w,),
                      TextNormal(title: 'PHP 249',size: 10.sp,height: 1.5.h,fontWeight: FontWeight.w400,),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.airline_seat_recline_extra,color: AppColors.textColor,size: 20.sp,),
                    TextNormal(title: '$cinemasNumber Cinemas',size: 10.sp,height: 1.5.h,fontWeight: FontWeight.w400,)
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 81.h,top: 17.h),
            child: Row(
              children: [
                Icon(Icons.star,color: AppColors.starColor,size: 15.sp,),
                SizedBox(width: 7.18.w,),
                TextNormal(title: '$startNumber',size: 10.sp,height: 1.5.h,)
              ],
            ),
          )

        ],
      ),
      width: 330.w,
      height: 113.h,
      decoration: BoxDecoration(
          color: AppColors.cardBackGroundColor,
          borderRadius: BorderRadius.circular(10.r)
      ),
    );
  }
}