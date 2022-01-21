import 'package:equatable/equatable.dart';
import 'package:movie_ticket/model/data_model.dart';

abstract class CubitStates extends Equatable{}
class InitialState extends CubitStates{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class LoadingState extends CubitStates{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LoadedState extends CubitStates{
  LoadedState(this.httpData);
   final List<DataModel> httpData;
  @override
  // TODO: implement props
  List<Object?> get props => [httpData];
}
