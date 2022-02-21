import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:passmanager/bloc/sing_up/sing_up_bloc.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/url.dart';
import 'package:passmanager/widget/button_max_width.dart';

class SingUp extends StatelessWidget {
  SingUp({Key? key}) : super(key: key);

  /// Переменная отвечающая за вызов валидации формы
  final _formKey = GlobalKey<FormState>();

  /// В данном списке хранится валидациия для полей
  List<String?> valid = [null, null, null];

  bool isLoad = false;

  /// Функция для рендринга окна
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, singIn, (route) => false);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: blue,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: BlocConsumer<SingUpBloc, SingUpState>(
          listener: (context, state) {
            if (state.isSucces == true) {
              ///Передача данных в окно подтверждения почты с помощью кода
              Navigator.pushNamed(context, confirmationCode, arguments: {
                "number": state.number,
                "login": state.login,
                "userName": state.userName,
                "password": state.password
              });
            }
            valid[0] = state.validUserName;
            valid[1] = state.validLogin;
            valid[2] = state.validPassword;
            isLoad = state.isLoad;
            if (_formKey.currentState!.validate()) {}
          },
          builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 30),
                    child: SvgPicture.asset(
                      "assets/logo.svg",
                      width: 180,
                    ),
                  ),
                ),
                _form(),
                isLoad
                    ? Center(
                        child: CircularProgressIndicator(
                          color: blue,
                        ),
                      )
                    : Button(
                        text: 'Регистрация',
                        backgroundColor: blue,
                        foregroundColor: white,
                        onPressed: () {
                          context.read<SingUpBloc>().add(OnLoad(true));
                          context.read<SingUpBloc>().add(OnResponse());
                        }),
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

  //Функция в которой находятся элементы формы регистрации
  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _name(), // Поле Имени
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          _login(), // Поле логина
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          _password(), // Поле пароля
          const Padding(padding: EdgeInsets.only(bottom: 15))
        ],
      ),
    );
  }

  // Виджет который создает поле Name
  Widget _name() {
    return BlocBuilder<SingUpBloc, SingUpState>(builder: (context, snapshot) {
      return TextFormField(
          onChanged: (value) =>
              context.read<SingUpBloc>().add(OnChangedUserName(value)),
          validator: (value) => valid[0],
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.people_alt_outlined),
            labelText: "Имя",
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

  // Виджет который создает поле Login
  Widget _login() {
    return BlocBuilder<SingUpBloc, SingUpState>(builder: (context, state) {
      return TextFormField(
          onChanged: (value) =>
              context.read<SingUpBloc>().add(OnChangedLogin(value)),
          validator: (value) => valid[1],
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email_outlined),
            labelText: "Электронная почта",
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

  // Виджет который создает поле Password
  Widget _password() {
    return BlocBuilder<SingUpBloc, SingUpState>(builder: (context, state) {
      return TextFormField(
        onChanged: (value) =>
            context.read<SingUpBloc>().add(OnChangedPassword(value)),
        validator: (value) => valid[2],
        obscureText: state.isObscure,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock_outline),
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
              context.read<SingUpBloc>().add(ChangedObscure(state.isCheck));
            },
          ),
        ),
      );
    });
  }
}
