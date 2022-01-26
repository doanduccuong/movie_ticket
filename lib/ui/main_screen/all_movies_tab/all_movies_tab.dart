import 'package:flutter/material.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/configs/constant.dart';
import 'package:movie_ticket/ui/component/text/text_bold.dart';
import 'package:movie_ticket/ui/main_screen/all_movies_tab/action_tab/action_tab.dart';
import 'package:movie_ticket/ui/main_screen/all_movies_tab/comedy_tab/comedy_tab.dart';
import 'package:movie_ticket/ui/main_screen/all_movies_tab/fantasy_tab/fantasy_tab.dart';
import 'package:movie_ticket/ui/main_screen/all_movies_tab/romance_tab/romance_tab.dart';
import 'package:movie_ticket/ui/main_screen/video_section/video_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          margin: EdgeInsets.only(left: 30.w, right: 209.w,bottom: 8.h),
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
          margin: EdgeInsets.only(left: 30.w),
          height: 22.h,
          width: 364.w,
          child: TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.transparent,
            indicator: BoxDecoration(
              color: AppColors.selectedBoxColor,
              borderRadius: BorderRadius.circular(5.r),
            ),
            controller: categoryTabController,
            tabs: List.generate(
              5,
              (index) {
                return Tab(
                  child: Text(Constants.texts[index]),
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
      ],
    );
  }
}
