import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/configs/constant.dart';
import 'package:movie_ticket/configs/images.dart';
import 'package:movie_ticket/cubit/app_cubit.dart';
import 'package:movie_ticket/cubit/app_cubit_states.dart';
import 'package:movie_ticket/ui/component/reuse_box/reuse_box.dart';
import 'package:movie_ticket/ui/component/text/text_bold.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  int _focusIndex=0;
  @override
  Widget build(BuildContext context) {
    void _onItemFocus(int index) {
      setState(() {
        _focusIndex=index;
      });
    }
    return BlocBuilder<AppCubit, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var httpData = state.httpData;
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 23.h,
                  width: 283.w,
                  margin:
                      EdgeInsets.only(top: 58.h, left: 35.5.w, right: 35.5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextNormal(
                        title: 'Allmovies',
                        size: 15.sp,
                        height: 1.5.h,
                      ),
                      TextNormal(
                        title: 'Forkids',
                        size: 15.sp,
                        height: 1.5.h,
                      ),
                      TextNormal(
                        title: 'My Tickets',
                        size: 15.sp,
                        height: 1.5.h,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w, bottom: 8.h, top: 23.h),
                  child: TextBold(
                      title: 'Coming Soon', size: 22.sp, height: 1.5.h),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 30.w,
                  ),
                  padding: EdgeInsets.only(left: 15.w, right: 16.w, top: 13.h),
                  child: Column(
                    children: [
                      Row(
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
                      SizedBox(
                        height: 51.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 58.h),
                        height: 34.h,
                        width: 34.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.selectedboxColor,
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: AppColors.textColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(AppImages.imgTicket),
                          TextNormal(
                            title: 'Ticket Available',
                            size: 9.sp,
                            height: 1.5.h,
                          )
                        ],
                      )
                    ],
                  ),
                  width: 320.w,
                  height: 220.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                          image: AssetImage(AppImages.imgBatman),
                          fit: BoxFit.cover)),
                ),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
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
                          ));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 28.w, left: 30.w, bottom: 17.h),
                  child: TextBold(
                      title: 'Now Showing', size: 22.sp, height: 1.5.h),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 18.48),
                  height: 242.52.h,
                  width: double.infinity,
                  child: ScrollSnapList(
                    shrinkWrap: true,
                    dynamicItemSize: true,
                    reverse: true,
                    itemBuilder: (context, index) => Container(
                      height: 201.64.h,
                      width: 177.6.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                            image: NetworkImage("https://image.tmdb.org/t/p/w500/c6H7Z4u73ir3cIoCteuhJh7UCAR.jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    itemCount: 3,
                    onItemFocus: (index){
                      return _onItemFocus(index);
                    },
                    itemSize: 177.6.w,
                  ),
                ),
                Center(
                  child: TextNormal(
                    title: 'Spiderman: No Way Home',
                    fontWeight: FontWeight.w500,
                    height: 1.5.h,
                    size: 16.sp,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReUseBox(
                      title: '13+',
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
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
  // Widget _builderList(context, index) {
  //   return Container(
  //     height: 201.64.h,
  //     width: 177.6.w,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20.r),
  //       image: DecorationImage(
  //           image: NetworkImage("https://image.tmdb.org/t/p/original/"+), fit: BoxFit.cover),
  //     ),
  //   );
  // }

}
