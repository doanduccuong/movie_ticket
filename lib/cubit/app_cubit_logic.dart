import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket/cubit/app_cubit.dart';
import 'package:movie_ticket/cubit/app_cubit_states.dart';
import 'package:movie_ticket/ui/main_screen/main_screen.dart';


class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());;
          }
          if(state is LoadedState){
            return MainScreen();
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}
