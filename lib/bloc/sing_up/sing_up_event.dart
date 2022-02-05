part of 'sing_up_bloc.dart';

/**
 * Обстрактный класс для событий экрана SingUp
*/
@immutable
abstract class SingUpEvent {}

/**
 * Класс который вызывается при вводе Login
 */
class OnChangedLogin extends SingUpEvent {
  final String login;

  OnChangedLogin(this.login);
}

/**
 * Класс который вызывается при вводе Password
 */
class OnChangedPassword extends SingUpEvent {
  final String password;

  OnChangedPassword(this.password);
}

/**
 * Класс который вызывается при вводе UserName
 */
class OnChangedUserName extends SingUpEvent {
  final String userName;

  OnChangedUserName(this.userName);
}
/**
 * Класс кторый вызывается при нажатии на кнопу зарегистрирвоатсья в этот
 * момент начинется запуска CircleProgressBar
 */
class OnLoad extends SingUpEvent {
  final bool isLoad;

  OnLoad(this.isLoad);
}

/**
 * Класс который вызывается при нажатие на иконку для отображения и
 * скрытия пароля
 */
class ChangedObscure extends SingUpEvent {
  final bool isObscure;

  ChangedObscure(this.isObscure);
}

/**
 * Класс который вызывается при нажатии кнопки регистрации в этот момент
 * проиходит отправка данных
 */
class OnResponse extends SingUpEvent {}
