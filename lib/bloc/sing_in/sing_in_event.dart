part of 'sing_in_bloc.dart';

/// Абстрактный класс для событий экрана SingIn
@immutable
abstract class SingInEvent {}

/// Событие которое, вызывается по нажатию на кнопку отобразить или скрыть пароль
/// [isObscure] статус отображения пароля
/// true не отображать
/// false отобразить
class ChangedObscure extends SingInEvent {
  final bool isObscure;

  ChangedObscure(this.isObscure);
}

/// Событие которое, вызывается когда пользваотель вводит данные в текстовое поле
/// логина
/// [login] переменная в которую передаются вводимые симолвы
class OnChangedLogin extends SingInEvent {
  final String login;

  OnChangedLogin(this.login);
}

/// Событие которое, вызывается когда пользваотель вводит данные в текстовое поле
/// пароля
/// [password] переменная в которую передаются вводимые симолвы
class OnChangedPassword extends SingInEvent {
  final String password;

  OnChangedPassword(this.password);
}

/// Событие которое, происходит после того как пользваоетль нажал на кнопку войти
/// после этого нужно отобразить CircularProgressIndicator
/// [isLoad] нужно ли запускать CircularProgressIndicator
///  true запускается CircularProgressIndicator
///  false отображается другой элемент
class OnLoad extends SingInEvent {
  final bool isLoad;

  OnLoad(this.isLoad);
}

/// Событие которое, происходит по нажатию на кнопку войти. В данный момент
/// отправляются данные по API
class OnResponse extends SingInEvent {}

/// Событие которое, происходит по нажатию на картинку для входа в панель
/// администратора
class OnAdminClick extends SingInEvent {}
