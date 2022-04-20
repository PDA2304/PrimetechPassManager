part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  final List<DataUser> listData;

  HomeState({required this.listData});
}

class HomeInitial extends HomeState {
  HomeInitial() : super(listData:<DataUser>[]);
}

class HomeLoad extends HomeState{
  final List<DataUser> listData;

  HomeLoad(this.listData) : super(listData:<DataUser>[]);
}
