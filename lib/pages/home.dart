import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passmanager/bloc/home/home_cubit.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/config.dart';
import 'package:passmanager/constant/url.dart';
import 'package:passmanager/widget/floating_action_message.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).allData();

    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 15, top: MediaQuery.of(context).padding.top + 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    foregroundColor: white,
                    backgroundColor: GenerateColor(Config.userId),
                    radius: 30,
                    child: Center(
                        child: Text(
                      Config.userName[0],
                      style: TextStyle(color: white, fontSize: 22),
                    )),
                  ),
                  Padding(padding: EdgeInsets.all(3)),
                  Text(
                    Config.userName,
                    style: TextStyle(
                      fontSize: 18,
                      color: black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "pahomovdaniil02@yandex.ru",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(2)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Divider(
                color: grey,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(children: [
                ListTile(
                  leading: const Icon(Icons.settings, color: blue),
                  title: Text(
                    "Настройки",
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.auto_delete, color: blue),
                  title: const Text(
                    "Корзина",
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, trash);
                  },
                ),
              ]),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app_outlined, color: blue),
              title: const Text(
                "Выход",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Config.clearUserData(); // Пока не будет реализована через bloc
                Navigator.pushNamedAndRemoveUntil(
                    context, singIn, (route) => false);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Данные"),
        centerTitle: true,
        backgroundColor: blue,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, addData);
        },
        child: const Icon(Icons.add),
        backgroundColor: blue,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if ((state) is! HomeLoad) {
          return Center(child: CircularProgressIndicator());
        }

        if (state.listData.isNotEmpty) {
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
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: blue),
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
      }),
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
