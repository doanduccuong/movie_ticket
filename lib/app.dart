import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_ticket/cubit/app_cubit.dart';
import 'package:movie_ticket/cubit/app_cubit_logic.dart';
import 'package:movie_ticket/service/data_service.dart';
import 'package:movie_ticket/ui/choose_cnime_seats/choose_cinemas_seats.dart';
import 'package:movie_ticket/ui/select_branch/select_branch.dart';
import 'package:movie_ticket/ui/detail_screen/detail_screen.dart';
import 'package:movie_ticket/ui/main_screen/main_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: () => MaterialApp(
        title: 'Ticket App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<AppCubit>(
          create: (context) => AppCubit(data: DataServices()),
          child: AppCubitLogics(),
        ),
      ),
    );
  }
}
