part of 'add_data_bloc.dart';

@immutable
abstract class AddDataState {
  final String name;
  final String login;
  final String password;
  final String description;
  final Map<int, dynamic> response = {
    422: {"name": null, "login": null, "password": null, "description": null}
  };
  final bool isLoad;
  final bool isSucces;
  final bool isObscure;

  bool get isCheck => !isObscure;

  String? get validName => response[422]["name"];

  String? get validLogin => response[422]["login"];

  String? get validPassword => response[422]["password"];

  String? get validDescription => response[422]["description"];

  AddDataState({
    this.name = '',
    this.login = '',
    this.password = '',
    this.description = '',
    this.isObscure = false,
    this.isLoad = false,
    this.isSucces = false,
  });
}

class Copy extends AddDataState {
  final Map<int, dynamic> response;
  final String name;
  final String login;
  final String password;
  final String description;
  final bool isObscure;
  final bool isLoad;

  Copy(this.name, this.login, this.password, this.description, this.response,
      this.isObscure, this.isLoad);
}

class Succes extends AddDataState {
  final bool isLoad;
  final bool isSucces;

  Succes(this.isLoad, this.isSucces);
}

class Response extends AddDataState {
  final Map<int, dynamic> response;
  final String name;
  final String login;
  final String password;
  final String description;
  final bool isObscure;
  final bool isLoad;

  Response(
    this.response,
    this.name,
    this.login,
    this.password,
    this.description,
    this.isObscure,
    this.isLoad,
  );
}
