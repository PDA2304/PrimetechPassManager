part of 'sing_in_bloc.dart';

/// Абстрактный класс для хранения состояния экрана SingIn
/// [isObscure] хранение состояния отображения или скрытия пароля
///  true скрыт
///  false показывать
/// [isSucces] хранение состояния успешной авторизации
/// true пользователь авторизовался и зашел в приложение
/// false пользваотель не авторизован
/// [isLoad] хранение состояни запуска CircularProgressIndicator
/// true CircularProgressIndicator
/// false отображаются другие элементы
/// [countAdmin] хранение счетчика для в хода в панель администратора
/// [login] хранение введеного логина пользователя
/// [password] хранение введеного пароля пользователя
/// [response] ответ полученный от api
@immutable
abstract class SingInState {
  final bool isObscure;
  final bool isSucces;
  final bool isLoad;
  final int countAdmin;
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

  String? get validPassword =>
      response[422]["password"] == null ? null : response[422]["password"][0];

  String? get validLogin =>
      response[422]["login"] == null ? null : response[422]["login"][0];

  SingInState({
    this.isObscure = true,
    this.isSucces = false,
    this.isLoad = false,
    this.countAdmin = 0,
    this.password = "",
    this.login = "",
  });
}

class Response extends SingInState {
  final Map<int, dynamic> response;
  final String password;
  final String login;
  final bool isObscure;
  final bool isLoad;

  Response(this.response, this.login, this.password, this.isObscure,
      this.isLoad,);
}

class Succes extends SingInState{
  final bool isSucces;

  Succes(this.isSucces);
}

class Copy extends SingInState {
  final bool isObscure;
  final bool isLoad;
  final String login;
  final String password;

  Copy(this.isObscure, this.isLoad, this.login, this.password);
}

class Admin extends SingInState {
  final int countAdmin;
  final String login;
  final String password;

  Admin(this.countAdmin, this.login, this.password);
}
