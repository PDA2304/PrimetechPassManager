import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passmanager/bloc/show_data/show_data_cubit.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/config.dart';
import 'package:passmanager/constant/url.dart';
import 'package:passmanager/data/model/Data.dart';
import 'package:passmanager/widget/button_icon.dart';
import 'package:passmanager/widget/custom_text_filed.dart';
import 'package:passmanager/widget/password_field.dart';

class ShowData extends StatelessWidget {
  final int dataId;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String?> valid = [null, null, null, null];

  ShowData({Key? key, required this.dataId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ShowDataCubit>().loadDataUser(dataId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Просмотр данных"),
        centerTitle: true,
        backgroundColor: blue,
        actions: [
          PopupMenuButton(
              tooltip: "Действия",
              itemBuilder: (context) => [
                    PopupMenuItem(
                        value: 0,
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.info_outline,
                                color: blue,
                              ),
                            ),
                            Text('Описание')
                          ],
                        )),
                    PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.group_add_sharp,
                                color: blue,
                              ),
                            ),
                            Text('Добавить пользователя')
                          ],
                        )),
                    PopupMenuItem(
                      value: 2,
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.delete,
                              color: red,
                            ),
                          ),
                          Text('Удалить')
                        ],
                      ),
                    )
                  ],
              onSelected: (item) {
                switch (item) {
                  case 0:
                    {
                      Navigator.pushNamed(context, dataInfo,arguments: dataId);
                      break;
                    }
                  case 2:
                    {
                      context.read<ShowDataCubit>().logicDeleteData(dataId);
                      break;
                    }
                  default:
                    {
                      break;
                    }
                }
              },
              icon: const Icon(Icons.more_vert_outlined))
        ],
      ),
      body: BlocConsumer<ShowDataCubit, ShowDataState>(
          listener: (context, state) {
        if ((state) is ShowDataDelete)
          Future.delayed(Duration(milliseconds: 500), () {
            Navigator.pushNamedAndRemoveUntil(context, home, (route) => false);
          });

        if (((state) is ShowDataError) || ((state) is ShowDataCancel)) {
          print("test");
          valid[0] = state.nameValidation;
          valid[1] = state.loginValidation;
          valid[2] = state.passwordValidation;
          valid[3] = state.descriptionValidation;
          if (_formKey.currentState!.validate()) {}
        }

        if ((state is ShowDataCancel) || ((state) is ShowDataLoad)) {
          nameController.text = state.name;
          nameController.selection = TextSelection.fromPosition(
              TextPosition(offset: nameController.text.length));
          loginController.text = state.login;
          loginController.selection = TextSelection.fromPosition(
              TextPosition(offset: loginController.text.length));
          passwordController.text = state.password;
          passwordController.selection = TextSelection.fromPosition(
              TextPosition(offset: passwordController.text.length));
          descriptionController.text = state.description!;
          descriptionController.selection = TextSelection.fromPosition(
              TextPosition(offset: descriptionController.text.length));
        }

        if (((state) is ShowDataUpdate)) {
          Navigator.pushNamedAndRemoveUntil(context, home, (route) => false);
        }
      }, builder: (context, state) {
        if (!(state is ShowDataLoad) &&
            !(state is ShowDataError) &&
            !((state) is ShowDataCancel)) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Container(
              width: 600,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CustomTextField(
                      validation: (value) => valid[0],
                      controller: nameController,
                      labelText: 'Название',
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CustomTextField(
                      validation: (value) => valid[1],
                      controller: loginController,
                      labelText: 'Логин',
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    PasswordField(
                      controller: passwordController,
                      isObscure: true,
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    CustomTextField(
                      validation: (value) => valid[3],
                      controller: descriptionController,
                      labelText: 'Описание',
                      minLines: 1,
                      maxLines: 5,
                      maxLength: 250,
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        ButtonIcon(
                          width: 150,
                          padding: 7,
                          border: 5,
                          onTap: () {
                            context.read<ShowDataCubit>().onCancel();
                          },
                          icon: Icons.cancel_outlined,
                          iconColor: white,
                          backgroundColor: blue,
                          text: "Отмена",
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        ButtonIcon(
                          width: 150,
                          padding: 7,
                          border: 5,
                          onTap: () {
                            context.read<ShowDataCubit>().onUpdate(
                                Data(
                                  name: nameController.value.text,
                                  login: loginController.value.text,
                                  password: passwordController.value.text,
                                  description: descriptionController.value.text,
                                ),
                                Config.userId,
                                dataId);
                          },
                          icon: Icons.save,
                          iconColor: white,
                          backgroundColor: blue,
                          text: "Сохранить",
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 15)),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
