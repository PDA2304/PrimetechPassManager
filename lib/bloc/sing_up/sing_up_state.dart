part of 'sing_up_bloc.dart';

/**
 * Обстрактный класс для состояния окна Регистрации
 */
@immutable
abstract class SingUpState {
  final bool isLoad;
  final bool isSucces;
  final bool isObscure;
  final String userName;
  final String login;
  final String password;
  final Map<int, dynamic> response = {
    422: {
      "user_name": [null],
      "login": [null],
      "password": [null]
    }
  };

  bool get isCheck => !isObscure;

  String? get validUserName =>
      response[422]["user_name"] == null ? null : response[422]["user_name"][0];

  String? get validpassword =>
      response[422]["password"] == null ? null : response[422]["password"][0];

  String? get validlogin =>
      response[422]["login"] == null ? null : response[422]["login"][0];

  SingUpState({
    this.isSucces = false,
    this.isLoad = false,
    this.userName = '',
    this.isObscure = true,
    this.login = '',
    this.password = '',
  });
}

class Response extends SingUpState {
  final Map<int, dynamic> response;
  final String userName;
  final String password;
  final String login;
  final bool isObscure;
  final bool isSucces;
  final bool isLoad;

  Response(this.response, this.userName, this.login, this.password,
      this.isObscure, this.isLoad, this.isSucces);
}

class Load extends SingUpState {
  final bool isLoad;

  Load(this.isLoad);
}

class Succes extends SingUpState {
  final bool isLoad;
  final bool isSucces;

  Succes(this.isLoad, this.isSucces);
}

class Copy extends SingUpState {
  final Map<int, dynamic> response;
  final String userName;
  final String password;
  final String login;
  final bool isObscure;
  final bool isLoad;

  Copy(this.userName, this.login, this.password, this.isObscure,
      this.response, this.isLoad);
}
