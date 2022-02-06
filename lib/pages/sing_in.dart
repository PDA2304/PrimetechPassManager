import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:passmanager/bloc/sing_in/sing_in_bloc.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/url.dart';
import 'package:passmanager/widget/button_max_width.dart';

class SingIn extends StatelessWidget {
  SingIn({Key? key}) : super(key: key);

  /// Переменная отвечающая за вызов валидации формы
  final _formKey = GlobalKey<FormState>();

  /// В данном списке хранится валидациия для полей
  List<String?> valid = [null, null];

  /// Функция для рендринга окна
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: BlocConsumer<SingInBloc, SingInState>(
          listener: (context, state) {
            /// Валидация логина
            valid[0] = state.validLogin;

            /// Валидация пароля
            valid[1] = state.validPassword;
            if (_formKey.currentState!.validate()) {}

            /// Условие перехода на новый экран
            if (state.isSucces) {
              Navigator.pushNamedAndRemoveUntil(
                  context, home, (route) => false);
            }

            /// Условие открытие showDialog для ввода пароля администратора
            if (state.countAdmin == 10) {
              showDialog(
                  context: context, builder: (_) => _showDialogAdminInput());
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 85, left: 30, bottom: 30),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        context.read<SingInBloc>().add(OnAdminClick());
                      },
                      child: SvgPicture.asset(
                        "assets/logo.svg",
                        width: 180,
                      ),
                    ),
                  ),
                ),
                _form(_formKey),
                _button(context, state.isLoad),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            );
          },
        ),
      ),
    );
  }

  /// Рендринг формы авторизации
  Widget _form(GlobalKey<FormState> formKey) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _login(),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          _password(),
          const Padding(padding: EdgeInsets.only(bottom: 15))
        ],
      ),
    );
  }

  /// Поле логина
  Widget _login() {
    return BlocBuilder<SingInBloc, SingInState>(builder: (context, state) {
      return TextFormField(
          onChanged: (value) =>
              context.read<SingInBloc>().add(OnChangedLogin(value)),
          validator: (value) => valid[0],
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            labelText: "Логин",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: blue,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: red),
            ),
          ));
    });
  }

  /// Поле пароля
  Widget _password() {
    return BlocBuilder<SingInBloc, SingInState>(
      builder: (context, state) {
        return TextFormField(
          style: const TextStyle(fontSize: 20),
          onChanged: (value) =>
              context.read<SingInBloc>().add(OnChangedPassword(value)),
          validator: (value) => valid[1],
          obscureText: state.isObscure,
          decoration: InputDecoration(
              labelText: "Пароль",
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: blue,
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: red),
              ),
              suffixIcon: InkWell(
                child: state.isObscure
                    ? const Icon(Icons.visibility_off, color: grey)
                    : const Icon(Icons.visibility, color: grey),
                onTap: () {
                  context.read<SingInBloc>().add(ChangedObscure(state.isCheck));
                },
              )),
        );
      },
    );
  }

  /// Кнопки и CircularProgressIndicator
  Widget _button(BuildContext context, bool isLoad) {
    return isLoad
        ? const Center(child: CircularProgressIndicator(color: blue))
        : Column(
            children: [
              Button(
                  text: 'Войти',
                  backgroundColor: blue,
                  foregroundColor: white,
                  onPressed: () {
                    context.read<SingInBloc>().add(OnLoad(true));
                    context.read<SingInBloc>().add(OnResponse());
                  }),
              Button(
                text: 'Регистрация',
                backgroundColor: null,
                foregroundColor: blue,
                onPressed: () => {Navigator.pushNamed(context, singUp)},
              ),
            ],
          );
  }

  /// Рендриг диалового окна
  Widget _showDialogAdminInput() {
    return SimpleDialog(
      title: Text("Вход под админом"),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(
              labelText: "Пароль",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: blue,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: red),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Button(
              text: "Войти",
              backgroundColor: blue,
              foregroundColor: white,
              onPressed: () {}),
        )
      ],
    );
  }
}
