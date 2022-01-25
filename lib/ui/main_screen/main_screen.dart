import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/cubit/app_cubit.dart';
import 'package:movie_ticket/cubit/app_cubit_states.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';
import 'package:movie_ticket/ui/main_screen/all_movies_tab/all_movies_tab.dart';
import 'for_kid_tab/forkid_tab.dart';
import 'my_tickets/my_tickets_tab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int selectedTab = 0;
  late TabController tabbarController;
  @override
  void initState() {
    // TODO: implement initState
    tabbarController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        bottom: TabBar(
          unselectedLabelColor: AppColors.textColor,
          indicatorColor: Colors.transparent,
          controller: tabbarController,
          tabs: [
            Tab(
              child: TextNormal(
                colors: tabbarController.index == 0
                    ? AppColors.selectedboxColor
                    : AppColors.textColor,
                title: 'Allmovies',
                size: 15.sp,
                height: 1.5.h,
              ),
            ),
            Tab(
              child: TextNormal(
                colors: tabbarController.index == 1
                    ? AppColors.selectedboxColor
                    : AppColors.textColor,
                title: 'For Kids',
                size: 15.sp,
                height: 1.5.h,
              ),
            ),
            Tab(
              child: TextNormal(
                colors: tabbarController.index == 2
                    ? AppColors.selectedboxColor
                    : AppColors.textColor,
                title: 'Your Tickets',
                size: 15.sp,
                height: 1.5.h,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: TabBarView(
        controller: tabbarController,
        children: [
          AllMoviesTab(),
          ForKidTab(),
          MyTicketTab(),
        ],
      ),
    );
  }
}
