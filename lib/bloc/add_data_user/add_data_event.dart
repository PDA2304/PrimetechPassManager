part of 'add_data_bloc.dart';

@immutable
abstract class AddDataEvent {}

/// Событие которое, вызывается когда пользователь вводит даныые в текстовое
/// поле название
/// [name]  переменная которое хранит введенные символы
class OnChangedName extends AddDataEvent {
  final String name;

  OnChangedName(this.name);
}

/// Событие которое, вызывается когда пользователь вводит данные в текстовое
/// поле логин
/// [login] переменная которое хранит введенные символы
class OnChangedLogin extends AddDataEvent {
  final String login;

  OnChangedLogin(this.login);
}

class OnChangedPassword extends AddDataEvent {
  final String password;

  OnChangedPassword(this.password);
}

class OnChangedDescription extends AddDataEvent {
  final String description;

  OnChangedDescription(this.description);
}

class OnLoad extends AddDataEvent {
  final bool isLoad;

  OnLoad(this.isLoad);
}

class OnChangedObscure extends AddDataEvent {
  final bool isObscure;

  OnChangedObscure(this.isObscure);
}

class OnResponse extends AddDataEvent {}
