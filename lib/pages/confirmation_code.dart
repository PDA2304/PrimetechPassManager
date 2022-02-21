import 'package:flutter/material.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/config.dart';
import 'package:passmanager/constant/url.dart';
import 'package:passmanager/data/network_service.dart';
import 'package:pinput/pin_put/pin_put.dart';

class ConfirmationCode extends StatelessWidget {
  final Map<String, Object?>? argument;

  ConfirmationCode({
    Key? key,
    this.argument,
  }) : super(key: key);
  TextEditingController _pinPutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, singUp, (route) => false);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: blue,
          ),
        ),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: SizedBox(
            height: 450,
            width: 500,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: SizedBox(
                            width: 250,
                            child: Text(
                              "Подтверждение регистрации",
                              style: TextStyle(fontSize: 30, color: blue),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        Center(
                          child: Text(
                            'На ващу почту ${argument!["login"]} был выслан код подтверждения. Введите его в форму для подтверждении регистрации.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  SizedBox(
                    width: 350,
                    height: 45,
                    child: PinPut(
                      fieldsCount: 5,
                      onSubmit: (String pin) {
                        if (pin == argument!["number"].toString()) {
                          /// Регистрация пользователя после успешного ввода кода подтверждения
                          _singUp(
                              argument!["userName"].toString(),
                              argument!["login"].toString(),
                              argument!["password"].toString(),
                              context);
                        } else {
                          /// Очистка поля и уведомление о том что код не верный
                          _showSnackBar(context);
                          _pinPutController.text = '';
                        }
                      },
                      focusNode: FocusNode(),
                      keyboardType: TextInputType.phone,
                      controller: _pinPutController,
                      submittedFieldDecoration: BoxDecoration(
                        border: Border.all(color: blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      selectedFieldDecoration: BoxDecoration(
                        border: Border.all(color: blue),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      followingFieldDecoration: BoxDecoration(
                        border: Border.all(color: orange),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  /// Регистрация пользователя
  void _singUp(String userName, String login, String password,
      BuildContext context) async {
    await NetworkService()
        .singUp(userName, login, password)
        .then((value) async {
      if (value.containsKey(200)) {
        Config.token = value[200]["token"];
        Config.userName = value[200]["user_name"];
        Config.userId = value[200]["id"];
        Config.saveUserData();
        Navigator.pushNamedAndRemoveUntil(context, home, (route) => false);
      }
    });
  }

  /// Виджет для того чтобы пользователь понял что код не верный
  void _showSnackBar(BuildContext context) {
    const snackBar = SnackBar(
      duration: Duration(seconds: 3),
      content: SizedBox(
        height: 40.0,
        child: Center(
          child: Text(
            'Код не совпадает',
            style: TextStyle(fontSize: 25.0, color: Colors.black),
          ),
        ),
      ),
      backgroundColor: white,
    );
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
