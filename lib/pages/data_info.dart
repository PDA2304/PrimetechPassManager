import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passmanager/bloc/data_info/data_info_cubit.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/config.dart';
import 'package:passmanager/data/model/DataUser.dart';

class ShowDataInfo extends StatelessWidget {
  final int dataId;

  const ShowDataInfo({Key? key, required this.dataId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(dataId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        centerTitle: true,
        title: const Text("Информация и описание"),
      ),
      body: BlocBuilder<DataInfoCubit, DataInfoState>(
        builder: (context, state) {
          if (state is! DataInfoLoad) {
            context.read<DataInfoCubit>().dataInfo(dataId);
            return const Center(child: CircularProgressIndicator());
          }

          return ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _text("Владелец", state.dataInfo.userName!),
                  _text("Дата создания", state.dataInfo.created!),
                  _text("Дата изменения", state.dataInfo.update!),
                  _userContainer(context, state.dataInfo.userName!,
                      state.dataInfo.userId!, state.dataInfo.share!),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: state.dataInfo.action!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                              state.dataInfo.action![index].employee!.login!),
                          subtitle:
                              Text(state.dataInfo.action![index].typeAction!),
                          trailing:
                              Text(state.dataInfo.action![index].actionDate!),
                          leading: CircleAvatar(
                            backgroundColor:
                                GenerateColor(state.dataInfo.userId),
                            radius: 20,
                            child: Text(
                              state.dataInfo.userName![0],
                              style: const TextStyle(color: white),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _userContainer(
    BuildContext context,
    String name,
    int userId,
    List<DataUser> share,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          color: grey,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Управление доступом",
          ),
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Container(
                  child: CircleAvatar(
                    backgroundColor: GenerateColor(userId),
                    radius: 20,
                    child: Text(
                      name[0],
                      style: const TextStyle(color: white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    color: black,
                    height: 50,
                    width: 1,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 71,
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: share.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (!(share[index].employee!.id == Config.userId || userId == share[index].employee!.id))
                        return Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: CircleAvatar(
                            backgroundColor:
                                GenerateColor(share[index].employee!.id),
                            radius: 20,
                            child: Text(
                              share[index].employee!.userName![0],
                              style: TextStyle(color: white),
                            ),
                          ),
                        );
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: grey,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "История",
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _text(String header, String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 10),
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
    );
  }
}
