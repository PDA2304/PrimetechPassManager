import 'package:flutter/material.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/url.dart';
import 'package:passmanager/widget/button_icon.dart';
import 'package:passmanager/widget/button_max_width.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Button(
            onPressed: () {},
            foregroundColor: white,
            backgroundColor: blue,
            text: 'Изменить учетные данные',
          ),
          ButtonIcon(
            icon: Icons.logout,
            iconColor: white,
            textColor: white,
            text: 'Выйти',
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, singIn, (route) => false);
            },
            border: 5,
            backgroundColor: blue,
          )
        ],
      ),
    );
  }
}
