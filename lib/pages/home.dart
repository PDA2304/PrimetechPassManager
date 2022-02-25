import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passmanager/bloc/home/home_cubit.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/config.dart';
import 'package:passmanager/constant/url.dart';

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
            : RefreshIndicator(
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
                                  style: TextStyle(fontSize: 18)),
                              subtitle: Text(state.listData[index].createdAt),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              );
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

  Widget _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, addData);
      },
      child: const Icon(Icons.add),
      backgroundColor: blue,
    );
  }

  List<Widget> _actions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showSearch(context: context, delegate: CustomSearch());
          },
          icon: const Icon(Icons.search))
    ];
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
