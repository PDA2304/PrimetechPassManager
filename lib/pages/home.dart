import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  getdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isRegistration', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
              title: const Text("Выход",style: TextStyle(backgroundColor: blue),),
              onTap: () {
                getdata();
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
        actions: _actions(context),
      ),
      floatingActionButton: _floatingActionButton(context),
      body: ListView(
        children: [
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Название", style: TextStyle(fontSize: 18)),
                        Expanded(flex: 2, child: SizedBox()),
                        Text("23.01.2022", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Название", style: TextStyle(fontSize: 18)),
                        Expanded(flex: 2, child: SizedBox()),
                        Text("23.01.2022", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Название", style: TextStyle(fontSize: 18)),
                        Expanded(flex: 2, child: SizedBox()),
                        Text("23.01.2022", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Название", style: TextStyle(fontSize: 18)),
                        Expanded(flex: 2, child: SizedBox()),
                        Text("23.01.2022", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Название", style: TextStyle(fontSize: 18)),
                        Expanded(flex: 2, child: SizedBox()),
                        Text("23.01.2022", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Название", style: TextStyle(fontSize: 18)),
                        Expanded(flex: 2, child: SizedBox()),
                        Text("23.01.2022", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Название", style: TextStyle(fontSize: 18)),
                        Expanded(flex: 2, child: SizedBox()),
                        Text("23.01.2022", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Доступные", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Название", style: TextStyle(fontSize: 18)),
                        Expanded(flex: 2, child: SizedBox()),
                        Text("23.01.2022", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Название", style: TextStyle(fontSize: 18)),
                        Expanded(flex: 2, child: SizedBox()),
                        Text("23.01.2022", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Название", style: TextStyle(fontSize: 18)),
                        Expanded(flex: 2, child: SizedBox()),
                        Text("23.01.2022", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Название", style: TextStyle(fontSize: 18)),
                        Expanded(flex: 2, child: SizedBox()),
                        Text("23.01.2022", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Название", style: TextStyle(fontSize: 18)),
                        Expanded(flex: 2, child: SizedBox()),
                        Text("23.01.2022", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Название", style: TextStyle(fontSize: 18)),
                        Expanded(flex: 2, child: SizedBox()),
                        Text("23.01.2022", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, showData);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text("Название", style: TextStyle(fontSize: 18)),
                        Expanded(flex: 2, child: SizedBox()),
                        Text("23.01.2022", style: TextStyle(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1, color: grey)
                ],
              ),
            ),
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
