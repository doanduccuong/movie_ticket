import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/configs/constant.dart';
import 'package:movie_ticket/cubit/app_cubit.dart';
import 'package:movie_ticket/cubit/app_cubit_states.dart';
import 'package:movie_ticket/ui/component/build_tab/build_tab.dart';
import 'package:movie_ticket/ui/component/reuse_box/reuse_box.dart';
import 'package:movie_ticket/ui/component/text/text_bold.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';
import 'package:movie_ticket/ui/main_screen/all_movies_tab/action_tab/action_tab.dart';
import 'package:movie_ticket/ui/main_screen/all_movies_tab/comedy_tab/comedy_tab.dart';
import 'package:movie_ticket/ui/main_screen/all_movies_tab/fantasy_tab/fantasy_tab.dart';
import 'package:movie_ticket/ui/main_screen/all_movies_tab/romance_tab/romance_tab.dart';
import 'package:movie_ticket/ui/main_screen/video_section/video_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class AllMoviesTab extends StatefulWidget {
  const AllMoviesTab({Key? key}) : super(key: key);

  @override
  State<AllMoviesTab> createState() => _AllMoviesTabState();
}

class _AllMoviesTabState extends State<AllMoviesTab>
    with SingleTickerProviderStateMixin {
  int chooseIndex = 0;
  late TabController categoryTabController;
  @override
  void initState() {
    // TODO: implement initState
    categoryTabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30.w, right: 209.w),
          child: TextBold(title: 'Coming Soon', size: 22.sp, height: 1.5.h),
        ),
        //video section
        const VideoSection(),
        //category tab
        SizedBox(
          height: 25.h,
        ),
        //category tab
        Container(
          height: 22.h,
          width: 364.w,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            indicator: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            controller: categoryTabController,
            tabs: List.generate(
              5,
                  (index) {
                return BuildTab(
                  title: Constants.texts[index],
                );
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 28.w, left: 30.w, bottom: 17.h),
          child: TextBold(title: 'Now Showing', size: 22.sp, height: 1.5.h),
        ),
        Expanded(
          child: Container(
            child: TabBarView(
              controller: categoryTabController,
              children: const [
                ActionTab(),
               ComedyTab(),
                RomanceTab(),
                RomanceTab(),
                FantasyTab(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
