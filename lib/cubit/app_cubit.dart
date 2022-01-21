import 'package:bloc/bloc.dart';
import 'package:movie_ticket/cubit/app_cubit_states.dart';
import 'package:movie_ticket/service/data_service.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit({required this.data}) : super(InitialState()) {
    getData();
  }
  final DataServices data;
  late final httpData;
  Future<void> getData() async {
    try {
      emit(LoadingState());
      httpData = await data.getInfo();
      emit(LoadedState(httpData));
    } catch (e) {
      print(e);
    }
  }
}
