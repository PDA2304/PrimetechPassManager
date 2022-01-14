import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passmanager/bloc/sing_in/sing_in_form_bloc.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/url.dart';
import 'package:passmanager/widget/button_max_width.dart';

class SingIn extends StatelessWidget {
  SingIn({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 100),
              width: MediaQuery.of(context).size.width,
              height: 190,
              child: const Text(
                "Авторизация",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: black,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            _form(_formKey),
            Button(
                text: 'Войти',
                backgroundColor: blue,
                foregroundColor: white,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                }),
            Button(
              text: 'Регистрация',
              backgroundColor: null,
              foregroundColor: blue,
              onPressed: () => {Navigator.pushNamed(context, singUp)},
            ),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom))
          ],
        ),
      ),
    );
  }

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

  Widget _login() {
    return const TextField(
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
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
  }

  Widget _password() {
    return BlocBuilder<SingInFormBloc, SingInFormState>(
      builder: (context, state) {
        return TextFormField(
          style: const TextStyle(fontSize: 20),
          onChanged: (value) {
            print(value);
            context.read<SingInFormBloc>().add(PasswordChanged(value));
            print(state.password);
          },
          validator: (value) => state.validPassword ,
          obscureText: state.isChek,
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
                child: state.isChek
                    ? const Icon(Icons.visibility_off,color: grey)
                    : const Icon(Icons.visibility,color: grey),
                onTap: () {
                  // BlocProvider.of<ObscureBloc>(context).add(ObscureChanged(state.isChek));
                  context
                      .read<SingInFormBloc>()
                      .add(ObscureCheckChanged(state.isChek));
                },
              )),
        );
      },
    );
  }
}
