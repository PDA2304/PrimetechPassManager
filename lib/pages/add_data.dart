import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passmanager/bloc/add_data_user/add_data_bloc.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/url.dart';
import 'package:passmanager/data/network_service.dart';
import 'package:passmanager/widget/button_max_width.dart';

class AddData extends StatelessWidget {
  AddData({Key? key}) : super(key: key);

  /// Переменная отвечающая за вызов валидации формы
  final _formKey = GlobalKey<FormState>();

  /// В данном списке хранится валидациия для полей
  List<String?> valid = [null, null, null, null];

  bool isLoad = false;

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
        child: BlocConsumer<AddDataBloc, AddDataState>(
          listener: (context, state) {
            valid[0] = state.validName;
            valid[1] = state.validLogin;
            valid[2] = state.validPassword;
            valid[3] = state.validDescription;
            isLoad = state.isLoad;
            if(state.isSucces) {
              Navigator.pushNamedAndRemoveUntil(context,home, (route) => false);
            }
            print(state.validPassword);
            if (_formKey.currentState!.validate()) {}
          },
          builder: (context, state) {
            return Column(
              children: [_form(context)],
            );
          },
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Form(
      key: _formKey,
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
          isLoad
              ? const Center(child: CircularProgressIndicator(color: blue))
              : Button(
                  onPressed: () {
                    context.read<AddDataBloc>().add(OnLoad(true));
                    context.read<AddDataBloc>().add(OnResponse());
                  },
                  foregroundColor: white,
                  text: 'Добавить данные',
                  backgroundColor: blue,
                ),
        ],
      ),
    );
  }

  Widget _name() {
    return BlocBuilder<AddDataBloc, AddDataState>(builder: (context, state) {
      return TextFormField(
          onChanged: (value) =>
              context.read<AddDataBloc>().add(OnChangedName(value)),
          validator: (value) => valid[0],
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
    });
  }

  Widget _login() {
    return BlocBuilder<AddDataBloc, AddDataState>(builder: (context, state) {
      return TextFormField(
          onChanged: (value) =>
              context.read<AddDataBloc>().add(OnChangedLogin(value)),
          validator: (value) => valid[1],
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

  Widget _password() {
    return BlocBuilder<AddDataBloc, AddDataState>(builder: (context, state) {
      return TextFormField(
          onChanged: (value) =>
              context.read<AddDataBloc>().add(OnChangedPassword(value)),
          validator: (value) => valid[2],
          obscureText: state.isObscure,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
            suffixIcon: InkWell(
              child: state.isObscure
                  ? const Icon(Icons.visibility_off, color: grey)
                  : const Icon(Icons.visibility, color: grey),
              onTap: () {
                context
                    .read<AddDataBloc>()
                    .add(OnChangedObscure(state.isCheck));
              },
            ),
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
    });
  }

  Widget _comment() {
    return SizedBox(
      child: BlocBuilder<AddDataBloc, AddDataState>(builder: (context, state) {
        return TextFormField(
          onChanged: (value) =>
              context.read<AddDataBloc>().add(OnChangedDescription(value)),
          validator: (value) => valid[3],
          maxLength: 250,
          obscureText: state.isCheck,
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
        );
      }),
    );
  }
}
