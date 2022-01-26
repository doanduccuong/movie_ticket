import 'package:bloc/bloc.dart';
import 'package:movie_ticket/cubit/app_cubit_states.dart';
import 'package:movie_ticket/model/data_model.dart';
import 'package:movie_ticket/service/data_service.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit({required this.data}) : super(InitialState()) {
    getData();
  }
  final DataServices data;
  late final httpData;
  late final httpDetailData;
  Future<void> getData() async {
    try {
      emit(LoadingState());
      httpData = await data.getInfo();
      emit(LoadedState(httpData: httpData));
    } catch (e) {
      print(e);
    }
  }

  getDetailData(DataModel data) {
    try {
      emit(DetailState(detailData: data));
    } catch (e) {
      print(e);
    }
  }
}
