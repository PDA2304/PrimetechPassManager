import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:passmanager/bloc/home/home_cubit.dart';
import 'package:passmanager/data/model/Data.dart';
import 'package:passmanager/data/model/Trash.dart';
import 'package:passmanager/data/network_service.dart';

part 'trash_state.dart';

class TrashCubit extends Cubit<TrashState> {
  TrashCubit(this.homeCubit) : super(TrashInitial(false));
  final HomeCubit homeCubit;

  var network = NetworkService();
  List<int> selectDataId = [];

  void allData() => network.indexLogicDeleteData().then((value) {
        emit(TrashLoad(value));
      });

  /// Функция выбара элементов в корзине
  void selectData(int index, bool check) {
    final list = (state as TrashLoad).list;
    var data = list.elementAt(index);
    data.check = check;
    check ? selectDataId.add(data.id!) : selectDataId.remove(data.id);
    emit(TrashLoad(list, isSelect: true));
    selectText(TypeText.countSelect);
  }

  /// Функция в которой создается лист по классу IndexData
  /// Данные в этот листа выбранных данных. Лист выбранных данных класса Trash
  /// Поэтому перезаписываем из лсита выбранных данных в лист типа IndexData
  List<IndexData> actionListIndexData(List<Trash> list) {
    List<IndexData> listIndexData = <IndexData>[];
    list.forEach((element) {
      listIndexData.add(IndexData(
          id: element.id, createdAt: element.createdAt, name: element.name));
    });
    return listIndexData;
  }

  /// Восстановление всех данных пользователя
  void restorationDataAll() {
    final list = (state as TrashLoad).list;
    homeCubit.restorationData(actionListIndexData(list));
    list.clear();
    network.logicRestorationDataAll().then((value) => emit(TrashLoad(list)));
  }

  /// Восстановление выбранных данных в корзине
  void restorationSelectData() {
    final list = (state as TrashLoad).list;
    List<Trash> restorationData = <Trash>[];
    list.forEach((element) {
      if (selectDataId.contains(element.id)) {
        restorationData.add(element);
      }
    });
    network.logicRestorationDataSelection(selectDataId);
    homeCubit.restorationData(actionListIndexData(restorationData));
    removeSelectListData();
  }

  /// Удаление выбранных данных в корзине
  void deleteSelectData() {
    network.deleteDataSelection(selectDataId);
    removeSelectListData();
  }

  /// Удаление выбранных элементов из списка корзины
  void removeSelectListData() {
    final list = (state as TrashLoad).list;
    selectDataId.forEach((elementId) {
      list.removeWhere((element) => element.id! == elementId);
    });
    emit(TrashLoad(list, isSelect: false));
  }

  void refreshData() {}

  void selectDataAll() {
    final list = (state as TrashLoad).list;
    if (list.where((element) => element.check == false).isEmpty) {
      selectDataId = <int>[];
      selectCheckChanged(list, true);
    } else {
      list.where((element) => element.check == false).forEach((element) {
        selectDataId.add(element.id!);
        element.check = true;
      });
    }
    emit(TrashLoad(list, isSelect: true));
    selectText(TypeText.countSelect);
  }

  /// Функция
  void closeSelect() {
    final list = (state as TrashLoad).list;
    // list.where((element) => element.check == true).forEach((element) {
    //   element.check = false;
    // });
    selectCheckChanged(list, true);
    emit(TrashLoad(list, isSelect: false));
  }

  void selectCheckChanged(List<Trash> list, bool check) {
    list.where((element) => element.check == check).forEach((element) {
      element.check = !check;
    });
  }

  /// Функция вывода текста в зависимовости от преданной в нее типа
  String selectText(TypeText typeText) {
    final list = (state as TrashLoad).list;
    int count = list.where((element) => element.check == true).length;
    String selectText = '';
    switch (typeText) {
      case TypeText.actionSelect:
        {
          if (count == list.length) {
            selectText = "Снять выделения";
          } else {
            selectText = "Выбрать всё";
          }
          break;
        }
      case TypeText.countSelect:
        {
          if (count == 0) {
            state.isPressed = true;
            selectText = "Выбрать элемент";
          } else {
            state.isPressed = false;
            selectText = "Выбрано: ${count}";
          }
          break;
        }
    }
    return selectText;
  }
}

enum TypeText { actionSelect, countSelect }
