import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/widget/button_icon.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text("Настройки"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _text('Имя', 'PDA', () {
            showDialog(
                context: context,
                builder: (_) => _allerDialogDelete(context, "имя",(){}));
          }),
          _text('Почта', 'pahomovdaniil02@yandex.ru', () {
            showDialog(
                context: context,
                builder: (_) => _allerDialogDelete(context, "почту",(){}));
          }),
          _text('Пароль', '', () {
            showDialog(
                context: context,
                builder: (_) => _allerDialogDelete(context, "пароль",(){}));
          })
        ],
      ),
    );
  }

  Widget _text(String header, String content, Function onTap) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header,
                  style: const TextStyle(fontSize: 18, color: black),
                ),
                Text(content)
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
            ),
            onPressed: () => onTap(),
            alignment: Alignment.centerRight,
          )
        ],
      ),
    );
  }

  Widget _allerDialogDelete(BuildContext context, String title, Function onTap) {
    return AlertDialog(
      title: Text("Изменить ${title}"),
      actions: [
        ElevatedButton(onPressed: () => onTap(), child: Text("Сохранить")),
        ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text("Отмена")),
      ],
      content: TextField(),
    );
  }
}
