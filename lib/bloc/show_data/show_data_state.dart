part of 'show_data_cubit.dart';

@immutable
abstract class ShowDataState {
  final String name;
  final String login;
  final String password;
  final String? description;

  String? nameValidation;
  String? loginValidation;
  String? passwordValidation;
  String? descriptionValidation;

  ShowDataState({
    this.name = '',
    this.login = '',
    this.password = '',
    this.description = '',
  });
}

class ShowDataInitial extends ShowDataState {}

class ShowDataLoad extends ShowDataState{
  final String name;
  final String login;
  final String password;
  final String? description;

  ShowDataLoad(
      this.name, this.login, this.password, this.description)
      : super();
}

class ShowDataCancel extends ShowDataState{
  final String name;
  final String login;
  final String password;
  final String? description;



  ShowDataCancel(this.name, this.login, this.password, this.description);
}

class ShowDataError extends ShowDataState{
  final String name;
  final String login;
  final String password;
  final String? description;

  ShowDataError(this.name, this.login, this.password, this.description);
}

class ShowDataUpdate extends ShowDataState{
  final String name;
  final String login;
  final String password;
  final String? description;

  ShowDataUpdate(
      this.name, this.login, this.password, this.description,)
      : super();
}

class ShowDataDelete extends ShowDataState{

}