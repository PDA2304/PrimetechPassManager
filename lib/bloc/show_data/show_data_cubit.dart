import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:passmanager/bloc/home/home_cubit.dart';
import 'package:passmanager/data/model/Data.dart';
import 'package:passmanager/data/network_service.dart';

part 'show_data_state.dart';

class ShowDataCubit extends Cubit<ShowDataState> {
  ShowDataCubit() : super(ShowDataInitial());
  var network = NetworkService();

  void logicDeleteData(int dataId) => network.logicDeleteData(dataId);

  void loadDataUser(int dataId) => network.userData(dataId).then((value) {
        emit(ShowDataLoad(
          value.name,
          value.login,
          value.password,
          value.description,
        ));
      });

  void onCancel() {
    state.nameValidation = null;
    state.loginValidation = null;
    state.passwordValidation = null;
    state.descriptionValidation = null;
    emit(ShowDataCancel(
        state.name, state.login, state.password, state.description));
  }

  void onUpdate(Data data, int userId, int dataId) {

    network.updateUserData(data, dataId).then((value) {
      if (value.containsKey(200)) {
        emit(ShowDataUpdate(
          data.name,
          data.login,
          data.password,
          data.description,
        ));
      }
      if (value.containsKey(422))
      {
        emit(ShowDataError(
            state.name, state.login, state.password, state.description));
        state.nameValidation = value[422]["name"];
        state.loginValidation = value[422]["login"];
        state.passwordValidation = value[422]["password"];
        state.descriptionValidation = value[422]["description"];
      }
    });
  }
}
