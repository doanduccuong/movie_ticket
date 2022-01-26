import 'package:flutter/material.dart';
import 'package:movie_ticket/configs/colors.dart';
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
  late TabController tabBarController;
  @override
  void initState() {
    // TODO: implement initState
    tabBarController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 58.h,left: 58.5.w),
          height: 23.h,
          width: 600.w,
          child: TabBar(
            labelColor: AppColors.selectedBoxColor,
            unselectedLabelColor: AppColors.textColor,
            indicatorColor: Colors.transparent,
            isScrollable: true,
            unselectedLabelStyle: TextStyle(height: 1.5.h,fontSize: 15.sp,fontFamily: 'Poppins'),
            controller: tabBarController,
            tabs: const [
              Tab(
                text: 'All Movie',
              ),
              Tab(
                
                text: 'For Kid',
              ),
              Tab(
                  text: 'Your Ticket',
              ),
            ],
          ),
        ),
        SizedBox(height: 23.h,),
        Expanded(
          child: TabBarView(
            controller: tabBarController,
            children: const [
              AllMoviesTab(),
              ForKidTab(),
              MyTicketTab(),
            ],
          ),
        ),
      ],
    ));
  }
}
