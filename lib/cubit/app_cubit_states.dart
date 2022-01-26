import 'package:equatable/equatable.dart';
import 'package:movie_ticket/model/data_model.dart';
import 'package:movie_ticket/model/fiml_review_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState({required this.httpData});
  final List<DataModel> httpData;
  @override
  // TODO: implement props
  List<Object?> get props => [httpData];
}

class DetailState extends CubitStates {
  final DataModel detailData;
  DetailState({
    required this.detailData,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [detailData];
}
