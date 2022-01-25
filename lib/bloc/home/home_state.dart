part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final int index;
  final String title;

  const HomeState({this.index = 0, this.title = ''});
}
class DataState extends HomeState {
  final String title;
  final int index;

  const DataState({this.title = 'Данные',this.index = 0}) : super(title: title,index: index);
 
  String get props => title;
}

class DataUserState extends HomeState {
  final String title;
  final int index;

  const DataUserState({this.title = 'Доступные',this.index = 1}) : super(title: title,index: index);

  String get props => title;
}

class SettingsState extends HomeState {
  final String title;
  final int index;

  const SettingsState({this.title = 'Настройки',this.index = 2}) : super(title: title,index: index);

  String get props => title;
}
