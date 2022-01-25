
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/configs/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_ticket/cubit/app_cubit.dart';
import 'package:movie_ticket/cubit/app_cubit_states.dart';
import 'package:movie_ticket/ui/component/reuse_box/reuse_box.dart';
import 'package:movie_ticket/ui/component/text/text_bold.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, CubitStates>(builder: (context, state) {
      if (state is DetailState) {
        var data = state.localData;
        var index = state.chooseIndex;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.backgroundColor,
          body: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 350.h,
                    ),
                    ReUseBox(
                      isFlexible: false,
                      title: 'Get Tickets',
                      isImage: true,
                      image: AppImages.imgTicket,
                      containerWidth: 169.w,
                      containerHeigh: 57.h,
                    ),
                    SizedBox(
                      height: 52.h,
                    ),
                    Container(
                      height: 22.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          left: 30.w, right: 141.w, bottom: 28.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ReUseBox(title: '13+'),
                          ReUseBox(title: 'Action'),
                          ReUseBox(title: 'IMAX'),
                          ReUseBox(title: '2 trailer'),
                        ],
                      ),
                    ),
                    TextBold(
                      title: data[index].title,
                      size: 18.sp,
                      height: 1.5.h,
                    ),
                  ],
                ),
                height: 547.h,
                width: 390.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(data[index].image), fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 31.h),
                width: 329.w,
                height: 104.h,
                child: TextNormal(
                  title: data[index].description,
                  size: 11.sp,
                  height: 1.5.h,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 258.w, left: 30.w, bottom: 23.h),
                child: TextBold(
                    title: '10.4 Comments', size: 12.sp, height: 1.5.h),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w, bottom: 31.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.iconbackgroundColor,
                      radius: 18.r,
                      child: TextNormal(
                        title: 'KC',
                        size: 15.sp,
                        height: 1.5.h,
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Container(
                      height: 17.h,
                      width: 253.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          hintText: 'Add a coment',
                          hintStyle: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w300,
                              color: AppColors.hinttextColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.iconbackgroundColor,
                      radius: 18.r,
                      child: TextNormal(
                        title: 'AG',
                        size: 15.sp,
                        height: 1.5.h,
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextNormal(
                          title: 'Andrew Garfield  2w ',
                          size: 10.sp,
                          height: 1.5.h,
                        ),
                        TextNormal(
                          title:
                              'This trailer looks sick! So excited to see this! <3',
                          size: 10.sp,
                          height: 1.5.h,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
