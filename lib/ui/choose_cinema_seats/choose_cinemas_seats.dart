import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/ui/choose_cinema_seats/seats_column.dart';
import 'package:movie_ticket/ui/choose_cinema_seats/widget/available_ticket.dart';
import 'package:movie_ticket/ui/choose_cinema_seats/widget/reserved_ticket.dart';
import 'package:movie_ticket/ui/choose_cinema_seats/widget/selected_ticket.dart';

import 'package:movie_ticket/ui/component/reuse_box/reuse_box.dart';
import 'package:movie_ticket/ui/component/text/text_bold.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';

class ChooseCinema extends StatelessWidget {
  const ChooseCinema({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.w, top: 59.h, bottom: 18.h),
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
                  title: 'Choose Cinema & Seats',
                  size: 15.sp,
                  height: 1.5.h,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 244.w, right: 30.w, bottom: 11.h),
            child: Row(
              children: [
                Icon(
                  Icons.edit_location,
                  color: AppColors.textColor,
                  size: 15.sp,
                ),
                SizedBox(
                  width: 6.w,
                ),
                TextNormal(
                  title: 'SM City Marikina',
                  size: 12.sp,
                  height: 1.5.h,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 285.w, bottom: 1.h),
            child: TextBold(title: 'Schedule', size: 16.sp, height: 1.5.h),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 233.w, bottom: 20.h),
            child: TextNormal(
              title: 'Date: February 2, 2021',
              size: 12.sp,
              height: 1.5.h,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w, right: 11.w, bottom: 20.h),
            height: 61.h,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 11.w),
                    padding: EdgeInsets.only(
                      top: 7.h,
                      left: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextNormal(
                          title: '2:30PM- 4:25PM',
                          size: 10.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.5.h,
                        ),
                        TextNormal(
                          title: 'Cinema: 1D',
                          size: 10.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.5.h,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.chair,
                              color: AppColors.textColor,
                              size: 12.sp,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            TextNormal(
                              title: '25 seats available',
                              size: 7.sp,
                              height: 1.3.h,
                            )
                          ],
                        )
                      ],
                    ),
                    width: 109.w,
                    height: 61.h,
                    decoration: BoxDecoration(
                        color: AppColors.iPrimaryColor,
                        borderRadius: BorderRadius.circular(10.r)),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 11.h, left: 30.w, right: 315.w),
            child: TextNormal(
              title: 'Seats',
              size: 16.sp,
              height: 1.5.h,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextNormal(
            title: 'Screen',
            size: 13.sp,
            height: 1.5.h,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(
            height: 19.h,
          ),
          seatColumn(),
          Container(
            margin: EdgeInsets.only(top: 27.5.h, left: 42.5.w),
            child: Row(
              children: [
                AvailableTicket(),
                TextNormal(
                  title: 'Available',
                  size: 13.sp,
                  height: 1.5.h,
                ),
                SizedBox(
                  width: 25.w,
                ),
                ReservedTicket(),
                TextNormal(
                  title: 'Reserved',
                  size: 13.sp,
                  height: 1.5.h,
                ),
                SizedBox(
                  width: 25.w,
                ),
                SelectedTicket(),
                TextNormal(
                  title: 'Selected',
                  size: 13.sp,
                  height: 1.5.h,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w, right: 40.w, top: 34.h),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextNormal(
                      title: '6 Seats',
                      size: 13.sp,
                      height: 1.5.h,
                    ),
                    TextBold(title: 'PHP 1494', size: 20.sp, height: 1.5.h)
                  ],
                ),
                SizedBox(
                  width: 60.w,
                ),
                ReUseBox(
                  isFlexible: false,
                  isImage: false,
                  title: 'Buy Now',
                  backgroundColor: AppColors.selectedBoxColor,
                  containerWidth: 169.w,
                  containerHeight: 57.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
