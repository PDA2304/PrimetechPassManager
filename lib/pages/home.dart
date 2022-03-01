import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passmanager/bloc/home/home_cubit.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/config.dart';
import 'package:passmanager/constant/url.dart';
import 'package:passmanager/widget/FloatingActionMessage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<HomeCubit>().allData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(context),
      appBar: AppBar(
        title: const Text("Данные"),
        centerTitle: true,
        backgroundColor: blue,
        actions: _actions(context),
      ),
      floatingActionButton: _floatingActionButton(context),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return state.isSucces
            ? Center(child: CircularProgressIndicator())
            : state.listData.isEmpty
                ? _nullData()
                : _allData(state);
      }),
    );
  }

  /// Боковое меню приложения
  Widget _drawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: blue,
              width: MediaQuery.of(context).size.width,
              child: const DrawerHeader(
                child: Text(
                  "Header",
                  style: TextStyle(color: white),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(children: [
              ListTile(
                leading: const Icon(Icons.create, color: blue),
                title: Text("Изменение учетных данных"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.auto_delete, color: blue),
                title: const Text("Корзина"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ]),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_outlined, color: blue),
            title: const Text("Выход"),
            onTap: () {
              Config.clearUserData(); // Пока не будет реализована через bloc
              Navigator.pushNamedAndRemoveUntil(
                  context, singIn, (route) => false);
            },
          ),
        ],
      ),
    );
  }

  /// Нижняя кнопка для перехода к окну добавление
  Widget _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, addData);
      },
      child: const Icon(Icons.add),
      backgroundColor: blue,
    );
  }

  /// Элементы действий
  /// Поиск
  List<Widget> _actions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showSearch(context: context, delegate: CustomSearch());
          },
          icon: const Icon(Icons.search))
    ];
  }

  /// Функция которая вызывается если нет ниодной записи
  Widget _nullData() {
    return RefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().onRefresh(),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: <Widget>[
                  Expanded(child: Container()),
                  const Text(
                    "Добавьте первую запись",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold, color: blue),
                  ),
                 const Padding(padding: EdgeInsets.all(2.5)),
                  const Text(
                    "Пароль и логин от сервера всегда \n будет у вас под ругой",
                    style: TextStyle(fontSize: 16, color: blue),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: EdgeInsets.only(right: 40, bottom: 90),
                    alignment: AlignmentGeometry.lerp(
                        Alignment.centerRight, Alignment.centerRight, 0),
                    child: FloatingActionMessage(color: blue),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ///Функция вызывается если у пользователя есть какие ли бо данные
  Widget _allData(HomeState state) {
    return RefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().onRefresh(),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: ListView.builder(
            itemCount: state.listData.length,
            itemBuilder: (context, index) {
              return Card(
                child: InkWell(
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, showData,
                          arguments: state.listData[index].id);
                    },
                    title: Text(state.listData[index].name,
                        style: const TextStyle(fontSize: 18)),
                    subtitle: Text(state.listData[index].createdAt),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("текст");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("");
  }
}
