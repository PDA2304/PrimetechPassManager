import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:passmanager/data/model/Data.dart';
import 'package:passmanager/data/model/DataUser.dart';
import 'package:passmanager/data/network_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  var network = NetworkService();

  /// Выводид все данные пользователя
  void allData() {
    network.allUserData().then((value) => emit(HomeLoad(value)));
  }

  /// Функция которая получает восстановленные данные из корзины и снова добаляет
  /// в основной список данных пользователя
  void restorationData(List<DataUser> indexDataList){
    final list = (state as HomeLoad).listData;
    list.addAll(indexDataList);
    emit(HomeLoad(list));
  }

  /// Обновляет данные пользователя если срабатывает событие
  /// onRefresh у элемента RefreshIndicator
  Future onRefresh() async =>
      network.allUserData().then((value) => emit(HomeLoad(value)));
}
