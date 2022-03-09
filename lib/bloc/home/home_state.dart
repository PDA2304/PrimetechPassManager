part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  final List<IndexData> listData;

  HomeState({required this.listData});
}

class HomeInitial extends HomeState {

  HomeInitial() : super(listData:<IndexData>[]);
}

class HomeLoad extends HomeState{
  final List<IndexData> listData;

  HomeLoad(this.listData) : super(listData:<IndexData>[]);
}
