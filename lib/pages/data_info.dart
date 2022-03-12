import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/widget/button_max_width.dart';

class DataInfo extends StatelessWidget {
  const DataInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        centerTitle: true,
        title: Text("Информация и описание"),
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child:  CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Text("Тип", "Учетные данные"),
                      _Text("Размер", "2 КБ"),
                      _Text("Владелец", "isip_d.a.pahomov@mpt.ru"),
                      _Text("Дата создания", "09.03.2022"),
                      _Text("Дата изменения", "09.03.2022"),
                      Divider(
                        color: grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Управление доступом",),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                child: Text("P"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Container(
                                  color: black,
                                  height: 50,
                                  width: 1,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 71,
                                height: 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 10,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return const Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: CircleAvatar(
                                        radius: 20,
                                        child: Text("D"),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("История",style: TextStyle(fontSize: 14),),
                      ),
                      Test(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Button(onPressed: (){},text: "Еще",foregroundColor:blue,backgroundColor:  Colors.transparent,),
                      )
                    ],
                  ))
            ],
          ),
      ),
    );
  }

  Widget Test() {
    List<String> testData = [
      "Удаление",
      "Добавление",
      "Добавление",
      "Добавление",
      "Добавление",
    ];
    List<Card> list = <Card>[];
    for (var post in testData) {
      list.add(Card(
        child: ListTile(
          title: Text("isip_d.a.pahomov@mpt.ru"),
          subtitle: Text(post),
          trailing: Text("20.03.2022"),
          leading: CircleAvatar(
            radius: 20,
            child: Text("D1"),
          ),
        ),
      ));
    }
    return Expanded(
        child: Column(
      children: [...list],
    ));
  }

  Widget _Text(String header, String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(header,style: TextStyle(fontSize: 18,color: black),), Text(content,style: TextStyle(),)],
      ),
    );
  }
}
