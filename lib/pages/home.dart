import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passmanager/bloc/home/home_bloc.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/url.dart';
import 'package:passmanager/pages/data.dart';
import 'package:passmanager/pages/settings.dart';

import 'data_user.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  Widget _floatingActionButton(BuildContext context, int index) {
    if (index == 0) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, addData);
        },
        child: const Icon(Icons.add),
        backgroundColor: blue,
      );
    }
    return Container();
  }

  List<Widget> _actions(BuildContext context, int index) {
    if (index == 2) {
      return [];
    }
    return [
      IconButton(
          onPressed: () {
            showSearch(context: context, delegate: CustomSearch());
          },
          icon: const Icon(Icons.search))
    ];
  }

  final List<Widget> _sreens = const [Data(), DataUser(), Settings()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(state.title),
          centerTitle: true,
          backgroundColor: blue,
          actions: _actions(context, state.index),
        ),
        floatingActionButton: _floatingActionButton(context, state.index),
        body: _sreens[state.index],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          unselectedItemColor: white,
          selectedIconTheme: const IconThemeData(
            opacity: 1.0,
          ),
          unselectedIconTheme: const IconThemeData(opacity: 0.5, size: 25),
          backgroundColor: blue,
          items: const [
            BottomNavigationBarItem(
              label: "Данные",
              icon: Icon(Icons.storage, color: white),
            ),
            BottomNavigationBarItem(
              label: "Доступные",
              icon: Icon(
                Icons.group,
                color: white,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Настройки',
              icon: Icon(
                Icons.settings,
                color: white,
                size: 25,
              ),
            ),
          ],
          onTap: (index) {
            context.read<HomeBloc>().add(LoadChanged(index));
          },
          currentIndex: state.index,
          selectedItemColor: white,
        ),
      );
    });
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
