import 'package:flutter/material.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/widget/button_icon.dart';
import 'package:passmanager/widget/button_max_width.dart';

class ShowData extends StatelessWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Просмотр данных"),
        centerTitle: true,
        backgroundColor: blue,
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                        value: 0,
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
                      value: 1,
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.history,
                              color: blue,
                            ),
                          ),
                          Text('История действий')
                        ],
                      ),
                    )
                  ],
              onSelected: (item) {},
              icon: const Icon(Icons.more_vert_outlined))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _form(),
            _button(),
            const Padding(padding: EdgeInsets.only(bottom: 15)),
            Center(
              child: Text(
                "Список пользователей доступным данные",
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            _user(context),
            const Padding(padding: EdgeInsets.only(bottom: 15)),
          ],
        ),
      ),
    );
  }

  Widget _form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(bottom: 20)),
        _name(),
        const Padding(padding: EdgeInsets.only(bottom: 20)),
        _login(),
        const Padding(padding: EdgeInsets.only(bottom: 20)),
        _password(),
        const Padding(padding: EdgeInsets.only(bottom: 20)),
        _comment(),
        const Text(
          "Дата создани: 24.01.2022",
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10)),
        const Text(
          "Создатель: PDA",
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10)),
      ],
    );
  }

  Widget _name() {
    return TextFormField(
      obscureText: true,
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
      ),
    );
  }

  Widget _login() {
    return TextFormField(
      obscureText: true,
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
      ),
    );
  }

  Widget _password() {
    return TextFormField(
      obscureText: true,
      style: const TextStyle(fontSize: 20),
      decoration: const InputDecoration(
        suffix: Icon(
          Icons.visibility_off,
          color: grey,
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
      ),
    );
  }

  Widget _comment() {
    return TextFormField(
      maxLength: 250,
      obscureText: true,
      style: const TextStyle(fontSize: 20),
      decoration: const InputDecoration(
        labelText: "Коменнарий",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: blue,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: red),
        ),
      ),
    );
  }

  Widget _button() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ButtonIcon(
            padding: 7,
            border: 5,
            onTap: () {},
            icon: Icons.delete,
            iconColor: white,
            backgroundColor: blue,
            text: "Удалить",
          ),
        ),
        const Padding(padding: EdgeInsets.all(15)),
        Expanded(
          child: ButtonIcon(
            padding: 7,
            border: 5,
            onTap: () {},
            icon: Icons.save,
            iconColor: white,
            backgroundColor: blue,
            text: "Сохранить",
          ),
        ),
      ],
    );
  }

  Widget _user(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: blue),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 15,left: 15,top: 10,bottom: 10),
        child: Row(
          children: [
            Text("Пользователи"),
            Expanded(flex:1,child: Container()),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.delete, color: red),
            //   padding: EdgeInsets.zero,
            // ),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.create, color: orange),
            //   padding: EdgeInsets.zero,
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child:  InkWell(
                onTap: (){},
                child: Icon(Icons.delete ,color: red,),
              ),
            )
            ,
            InkWell(
              onTap: (){},
              child: Icon(Icons.create ,color: orange,),
            )
          ],
        ),
      ),
    );
  }
}
