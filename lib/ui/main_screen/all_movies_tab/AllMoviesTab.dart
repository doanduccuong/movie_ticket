import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/configs/constant.dart';
import 'package:movie_ticket/cubit/app_cubit.dart';
import 'package:movie_ticket/ui/component/reuse_box/reuse_box.dart';
import 'package:movie_ticket/ui/component/text/text_bold.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';
import 'package:movie_ticket/ui/main_screen/video_section/video_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class AllMoviesTab extends StatefulWidget {
  const AllMoviesTab({Key? key}) : super(key: key);

  @override
  State<AllMoviesTab> createState() => _AllMoviesTabState();
}

class _AllMoviesTabState extends State<AllMoviesTab> {
  int _selectedIndex = 0;
  int _focusIndex = 0;
  int chooseIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(left: 30.w, right: 209.w),
            child: TextBold(title: 'Coming Soon', size: 22.sp, height: 1.5.h)),
        //video section
        const VideoSection(),
        Container(
          margin: EdgeInsets.only(left: 30.w, top: 25.h),
          height: 22.h,
          width: double.infinity,
          child: ListView.builder(
            itemCount: Constants.texts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;

                  });
                },
                child: Column(
                  children: [
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        child: TextNormal(
                          title: Constants.texts[index],
                          size: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        margin: EdgeInsets.only(right: 17.w),
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        height: 22.h,
                        decoration: BoxDecoration(
                          color: _selectedIndex == index
                              ? AppColors.selectedboxColor
                              : AppColors.unselectedboxColor,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                    ),
                  ],
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
          margin: EdgeInsets.only(bottom: 18.48.h),
          height: 242.52.h,
          width: double.infinity,
          child: ScrollSnapList(
            shrinkWrap: true,
            dynamicItemSize: true,
            reverse: true,
            itemBuilder: (context, index) => InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  chooseIndex=index;
                });
                BlocProvider.of<AppCubit>(context).getDetailData(chooseIndex);
              },
              child: Container(
                height: 201.64.h,
                width: 177.6.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                      image: AssetImage(Constants.images[index]),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            itemCount: 3,
            onItemFocus: (int index) {
              _onItemFocus(index);
            },
            itemSize: 177.6.w,
          ),
        ),
        Center(
          child: TextNormal(
            title: Constants.filmDetail[_focusIndex].title!,
            fontWeight: FontWeight.w500,
            height: 1.5.h,
            size: 16.sp,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReUseBox(
              title: Constants.filmDetail[_focusIndex].ageRestrict,
            ),
            SizedBox(
              width: 10.w,
            ),
            ReUseBox(title: 'Action'),
            SizedBox(
              width: 10.w,
            ),
            ReUseBox(
              title: 'IMAX',
            )
          ],
        )
      ],
    );
  }

  void _onItemFocus(int index) {
    setState(
      () {
        _focusIndex = index;
      },
    );
  }
}
