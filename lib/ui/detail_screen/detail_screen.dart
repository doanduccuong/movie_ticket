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
import 'package:movie_ticket/ui/detail_screen/widget/expandable_text.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, CubitStates>(
      builder: (context, state) {
        if (state is DetailState) {
          DetailState httpDetailState = state;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.backgroundColor,
            body: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<AppCubit>(context).goMainScreen();
                        },
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 300.h),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<AppCubit>(context)
                              .goChoseSeatScreen();
                        },
                        child: ReUseBox(
                          isFlexible: false,
                          title: 'Get Tickets',
                          isImage: true,
                          image: AppImages.imgTicket,
                          containerWidth: 169.w,
                          containerHeight: 57.h,
                        ),
                      ),
                      SizedBox(
                        height: 52.h,
                      ),
                      Container(
                        height: 22.h,
                        width: 214.w,
                        margin: EdgeInsets.only(
                            left: 30.w, bottom: 28.h, right: 141.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ReUseBox(title: '13+'),
                            ReUseBox(title: 'Action'),
                            ReUseBox(title: 'IMAX'),
                            ReUseBox(title: '2Trailers'),
                          ],
                        ),
                      ),
                      TextBold(
                        title: httpDetailState.detailData.originalTitle!,
                        size: 18.sp,
                        height: 1.5.h,
                      ),
                    ],
                  ),
                  height: 547.h,
                  width: 390.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://image.tmdb.org/t/p/w500" +
                            httpDetailState.detailData.posterPath!),
                        fit: BoxFit.cover),
                  ),
                ),
                //Expand text
                ExpandableText(
                  overViewTex: httpDetailState.detailData.overview.toString(),
                ),
                Container(
                  margin:
                      EdgeInsets.only(right: 258.w, left: 30.w, bottom: 23.h),
                  child: TextBold(
                      title: '10.4 Comments', size: 12.sp, height: 1.5.h),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30.w, bottom: 31.h),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.iconBackGroundColor,
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
                      SizedBox(
                        height: 17.h,
                        width: 253.w,
                        child: TextFormField(
                          style: const TextStyle(color: AppColors.textColor),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.underLineBorderColor),
                            ),
                            hintText: 'Add a comment',
                            hintStyle: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w300,
                                color: AppColors.hintTextColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30.w, bottom: 22.h),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.iconBackGroundColor,
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
      },
    );
  }
}
