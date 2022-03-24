import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passmanager/bloc/trash/trash_cubit.dart';
import 'package:passmanager/constant/colors.dart';

class TrashPages extends StatelessWidget {
  TrashPages({Key? key}) : super(key: key);
  bool isEmpty = true;

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      backgroundColor: blue,
      title: BlocBuilder<TrashCubit, TrashState>(
        builder: (context, state) {
          return state.isSelect
              ? Text(context.read<TrashCubit>().selectText(TypeText.countSelect))
              : const Text("Корзина");
        },
      ),
      centerTitle: true,
      leading: BlocBuilder<TrashCubit, TrashState>(
        builder: (context, state) {
          return state.isSelect
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    context.read<TrashCubit>().closeSelect();
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                );
        },
      ),
      actions: [
        BlocConsumer<TrashCubit, TrashState>(
          listener: (context, state) {
            // if ((state) is TrashRequest)
            //     Navigator.pop(context);
          },
          builder: (context, state) {
            return state.isSelect || isEmpty
                ? Container()
                : PopupMenuButton(
                    tooltip: "Действия",
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              value: 0,
                              child: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.select_all_sharp,
                                      color: blue,
                                    ),
                                  ),
                                  Text('Выбрать всё')
                                ],
                              )),
                          PopupMenuItem(
                            value: 1,
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.restore,
                                    color: blue,
                                  ),
                                ),
                                Text('Восстановить всё')
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.delete,
                                    color: red,
                                  ),
                                ),
                                Text('Очистить корзину')
                              ],
                            ),
                          )
                        ],
                    onSelected: (item) {
                      switch (item) {
                        case 0:
                          return context.read<TrashCubit>().selectDataAll();
                        case 1:
                          {
                            context.read<TrashCubit>().restorationDataAll();
                            break;
                          }
                        case 2:
                          {
                            showDialog(
                                context: context,
                                builder: (_) => _allerDialogDelete(context));
                            break;
                          }
                      }
                    },
                    icon: const Icon(Icons.more_vert_outlined));
          },
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: BlocBuilder<TrashCubit, TrashState>(
        builder: (context, state) {
          if ((state) is TrashLoad) {
            isEmpty = state.list.isEmpty;
            return state.list.isEmpty
                ? RefreshIndicator(
                    onRefresh: _refreshData,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.delete_outline_outlined,
                              size: 100,
                              color: grey,
                            ),
                            Text(
                              "Корзина пуста",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: grey,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: _refreshData,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: SafeArea(
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  itemCount: state.list.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: InkWell(
                                        child: ListTile(
                                          trailing: AnimatedContainer(
                                            height: state.isSelect
                                                ? appBar.preferredSize.height
                                                : 0,
                                            duration:
                                                Duration(milliseconds: 300),
                                            child: FittedBox(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.5),
                                                child: Checkbox(
                                                  checkColor: Colors.white,
                                                  value:
                                                      state.list[index].check,
                                                  onChanged: (bool? value) {
                                                    context
                                                        .read<TrashCubit>()
                                                        .selectData(
                                                            index, value!);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          onTap: () {},
                                          onLongPress: () {
                                            context
                                                .read<TrashCubit>()
                                                .selectData(index, true);
                                          },
                                          title: Text(state.list[index].name,
                                              style: const TextStyle(
                                                  fontSize: 18)),
                                          subtitle:
                                              Text(state.list[index].createdAt),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            AnimatedContainer(
                              height: state.isSelect
                                  ? appBar.preferredSize.height
                                  : 0,
                              duration: Duration(milliseconds: 300),
                              color: blue,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    _rowBottomSheet(
                                        Icons.select_all_outlined,
                                        context
                                            .read<TrashCubit>()
                                            .selectText(TypeText.actionSelect),
                                        () => context
                                            .read<TrashCubit>()
                                            .selectDataAll(),
                                        false),
                                    _rowBottomSheet(
                                        Icons.restore,
                                        "Восстановить",
                                        () => context
                                            .read<TrashCubit>()
                                            .restorationSelectData(),
                                        state.isPressed),
                                    _rowBottomSheet(
                                        Icons.delete,
                                        "Удалить",
                                        () => context
                                            .read<TrashCubit>()
                                            .deleteSelectData(),
                                        state.isPressed)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
          } else {
            context.read<TrashCubit>().allData();
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _rowBottomSheet(
      IconData icon, String text, Function onPressed, bool isPressed) {
    return Expanded(
      child: TextButton(
        onPressed: isPressed ? null : () => onPressed(),
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: white,
                ),
                Text(
                  text,
                  style: const TextStyle(color: white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _allerDialogDelete(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("Очистка корзины"),
      actions: [
        CupertinoDialogAction(
          onPressed: () {},
          child: const Text("Да"),
          textStyle: const TextStyle(color: red),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Нет"),
          textStyle: const TextStyle(color: green),
        ),
      ],
      content: const Text("Вы действительно хотите \n очистить всю корзину?"),
    );
  }
}
