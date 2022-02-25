part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  final bool isSucces;
  final List<IndexData> listData;

  HomeState(this.isSucces, {required this.listData});
}

class HomeInitial extends HomeState {
  final List<IndexData> listData;
  final bool isSucces;

  HomeInitial(this.isSucces,this.listData) : super(true,listData:<IndexData>[]);
}
