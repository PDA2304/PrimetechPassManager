part of 'sing_in_form_bloc.dart';

@immutable
abstract class SingInFormEvent {}

class ObscureCheckChanged extends SingInFormEvent {
  final bool isChek;

  ObscureCheckChanged(this.isChek);
}

class PasswordChanged extends SingInFormEvent {
  final String password;

  PasswordChanged(this.password);
}
