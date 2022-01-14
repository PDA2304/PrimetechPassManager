part of 'sing_in_form_bloc.dart';

class SingInFormState {
  final bool isObscure;
  bool get isChek => !isObscure;

  final String password;
  String get validPassword {
    return "";
  }

  SingInFormState({this.isObscure = false, this.password = ""});

  SingInFormState copyWith({bool? isObscure, String? password}) {
    return SingInFormState(
      isObscure: isObscure ?? this.isObscure,
      password: password ?? this.password,
    );
  }
}
