import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/data/model/Employee.dart';
import 'package:passmanager/data/network_service.dart';
import 'package:passmanager/widget/button_max_width.dart';

class ShareAddUser extends StatefulWidget {
  final int dataId;
  const ShareAddUser({Key? key,required this.dataId}) : super(key: key);

  @override
  State<ShareAddUser> createState() => _ShareAddUserState(dataId: dataId);
}

class _ShareAddUserState extends State<ShareAddUser> {
  List<Employee> listEmployeeSearch = <Employee>[];
  TextEditingController contoller = TextEditingController();
  bool isSelectUser = false;
  bool isLoad = false;
  final int? dataId;
  _ShareAddUserState({this.dataId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        centerTitle: true,
        title: Text("Поделиться данными"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
                controller: contoller,
                decoration: InputDecoration(
                  labelText: "Поиск",
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: blue,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: red),
                  ),
                  suffixIcon: InkWell(
                    child: const Icon(Icons.search, color: grey),
                    onTap: () {
                      if (contoller.text.trim() != "") {
                        setState(() {
                          isLoad = true;
                          NetworkService()
                              .employeeSearch(contoller.text)
                              .then((value) {
                            setState(() {
                              listEmployeeSearch = value;
                              isLoad = false;
                            });
                          });
                        });
                      }
                    },
                  ),
                )),
          ),
          isLoad
              ? const CircularProgressIndicator()
              : Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: false),
                          child: ListView.builder(
                            // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            //     crossAxisCount: 1, childAspectRatio: 5),
                            itemCount: listEmployeeSearch.length,
                            itemBuilder: (context, count) {
                              return Card(
                                child: InkWell(
                                  onTap: (){
                                    NetworkService().addDataUser(listEmployeeSearch[count].id, dataId!).then((value) => Navigator.pop(context));
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: ListTile(
                                      title: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                              listEmployeeSearch[count].login!)),
                                      leading: CircleAvatar(
                                        child: Text(
                                          listEmployeeSearch[count].userName![0],
                                          style: TextStyle(color: white),
                                        ),
                                        backgroundColor: GenerateColor(
                                            listEmployeeSearch[count].id),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      isSelectUser
                          ? Expanded(
                              flex: 2,
                              child: AnimatedContainer(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ScrollConfiguration(
                                        behavior:
                                            ScrollConfiguration.of(context)
                                                .copyWith(scrollbars: false),
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5, left: 5),
                                            child: GridView.builder(
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        crossAxisSpacing: 5,
                                                        childAspectRatio: 4),
                                                scrollDirection: Axis.vertical,
                                                itemCount: 20,
                                                itemBuilder: (context, count) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 5),
                                                    child: InkWell(
                                                      onLongPress: () {
                                                        print("test");
                                                      },
                                                      onTap: () {
                                                        print("asd");
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        color: GenerateColor(
                                                            count),
                                                        child: Text(
                                                          "звф",
                                                          style: TextStyle(
                                                              color: white,
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                })
                                            // GridView.builder(
                                            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            //         crossAxisCount: 8, // Три столбца в строке
                                            //         childAspectRatio: 1.0 // Ширина и высота области отображения равны
                                            //     ),
                                            //     scrollDirection: Axis.vertical,
                                            //     itemCount: 20,
                                            //     itemBuilder: (context, count) {
                                            //       return Padding(
                                            //         padding:
                                            //             const EdgeInsets.only(bottom: 5),
                                            //         child: InkWell(
                                            //           onLongPress: () {
                                            //             print("test");
                                            //           },
                                            //           onTap: () {
                                            //             print("asd");
                                            //           },
                                            //           child:  Container(
                                            //             width: 100,
                                            //             color: GenerateColor(count),
                                            //             child:  Text(
                                            //               "звф",
                                            //               style: TextStyle(color: white,fontSize: 14),
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       );
                                            //     })
                                            // ListView.builder(
                                            //   itemCount: 20,
                                            //   scrollDirection: Axis.horizontal,
                                            //   shrinkWrap: true,
                                            //
                                            //   physics: BouncingScrollPhysics(),
                                            //   itemBuilder: (context, count) {
                                            //     return Padding(
                                            //       padding: const EdgeInsets.only(bottom: 5),
                                            //       child: InkWell(
                                            //         onLongPress: () {
                                            //           print("test");
                                            //         },
                                            //         onTap: () {
                                            //           print("asd");
                                            //         },
                                            //         child: Card(
                                            //           color: GenerateColor(count),
                                            //           child: Padding(
                                            //             padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                            //             child: Text(
                                            //               count.toString(),
                                            //               style: TextStyle(color: white),
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //     );
                                            //   },
                                            // ),
                                            ),
                                      ),
                                    ),
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Button(
                                          onPressed: () {},
                                          text: "Сохранить",
                                          foregroundColor: white,
                                          backgroundColor: blue,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                duration: Duration(seconds: 1),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
