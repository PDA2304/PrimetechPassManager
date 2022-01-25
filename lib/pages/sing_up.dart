import 'package:flutter/material.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/url.dart';
import 'package:passmanager/widget/button_max_width.dart';

class SingUp extends StatelessWidget {
  SingUp({Key? key}) : super(key: key);
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
                "Регистрация",
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
                text: 'Регистрация',
                backgroundColor: blue,
                foregroundColor: white,
                onPressed: () {

                }),
            Button(
              text: 'Назад',
              backgroundColor: null,
              foregroundColor: blue,
              onPressed: () => {Navigator.pushNamedAndRemoveUntil(context, singIn, (route) => false)},
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
          _name(),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          _login(),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          _password(),
          const Padding(padding: EdgeInsets.only(bottom: 15))
        ],
      ),
    );
  }

  Widget _name()
  {
    return TextFormField(
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
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
    return TextFormField(
          style: const TextStyle(fontSize: 20),
          onChanged: (value) {
          },
          decoration: const InputDecoration(
              labelText: "Пароль",
              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(
                  color: blue,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: red),
              ),
              // suffixIcon: InkWell(
              //   child: state.isChek
              //       ? const Icon(Icons.visibility_off,color: grey)
              //       : const Icon(Icons.visibility,color: grey),
              //   onTap: () {
              //     // BlocProvider.of<ObscureBloc>(context).add(ObscureChanged(state.isChek));
              //     context
              //         .read<SingInFormBloc>()
              //         .add(ObscureCheckChanged(state.isChek));
              //   },
              // )),
        )
    );
  }

}
