part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadChanged extends HomeEvent {
  final int index;
  LoadChanged(this.index);
}

