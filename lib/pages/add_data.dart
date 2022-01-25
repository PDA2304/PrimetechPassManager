import 'package:flutter/material.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/widget/button_max_width.dart';

class AddData extends StatelessWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавление данных"),
        centerTitle: true,
        backgroundColor: blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [_form()],
        ),
      ),
    );
  }

  Widget _form() {
    return Form(
      child: Column(
        children: [
          _name(),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          _login(),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          _password(),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          _comment(),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          Button(
            onPressed: () {},
            foregroundColor: white,
            text: 'Добавить данные',
            backgroundColor: blue,
          ),
        ],
      ),
    );
  }

  Widget _name() {
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
    return TextFormField(
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
  }

  Widget _password() {
    return TextFormField(
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
        ));
  }

  Widget _comment ()
  {
    return SizedBox(
      child: TextFormField(
        maxLength: 250,
        decoration: const InputDecoration(
          labelText: "Комментарий",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: blue,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: red),
          ),
        ),
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 5,
      ),
    );
  }
}
