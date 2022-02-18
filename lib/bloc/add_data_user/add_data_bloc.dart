import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:passmanager/data/network_service.dart';

part 'add_data_event.dart';

part 'add_data_state.dart';

class AddDataBloc extends Bloc<AddDataEvent, AddDataState> {
  AddDataBloc()
      : super(Copy(
            '',
            '',
            '',
            '',
            const {
              422: {
                "name": null,
                "login": null,
                "password": null,
                "description": null
              }
            },
            true,
            false)) {
    on<AddDataEvent>((event, emit) async {
      var network = NetworkService();

      /**
       * Если сработало событие то данные которые находятся в event отправляются
       * в состояния для их хранения. Данное условие срабатывает, когда
       * пользователь вводит название
       */
      if (event is OnChangedName) {
        emit(Copy(event.name, state.login, state.password, state.description,
            state.response, state.isObscure, state.isLoad));
      }

      /**
       * Если сработало событие то данные которые находятся в event отправляются
       * в состояния для их хранения. Данное условие срабатывает, когда
       * пользователь вводит логин
       */
      if (event is OnChangedLogin) {
        emit(Copy(state.name, event.login, state.password, state.description,
            state.response, state.isObscure, state.isLoad));
      }

      /**
       * Если сработало событие то данные которые находятся в event отправляются
       * в состояния для их хранения. Данное условие срабатывает, когда
       * пользователь вводит пароль
       */
      if (event is OnChangedPassword) {
        emit(Copy(state.name, state.login, event.password, state.description,
            state.response, state.isObscure, state.isLoad));
      }

      /**
       * Если сработало событие то данные которые находятся в event отправляются
       * в состояния для их хранения. Данное условие срабатывает, когда
       * пользователь вводит описание
       */
      if (event is OnChangedDescription) {
        emit(Copy(state.name, state.login, state.password, event.description,
            state.response, state.isObscure, state.isLoad));
      }

      if (event is OnChangedObscure) {
        emit(Copy(state.name, state.login, state.password, state.description,
            state.response, event.isObscure, state.isLoad));
      }

      if (event is OnLoad) {
        print(state.password);
        emit(Copy(state.name, state.login, state.password, state.description,
            state.response, state.isObscure, event.isLoad));
      }

      if (event is OnResponse) {
        await network
            .addData(state.name, state.login, state.password, state.description)
            .then((value) async {
          if (value.containsKey(200)) {
            emit(Succes(true, true));
          }
          if (value.containsKey(422)) {
            print(value[422]);
            emit(Response(value, state.name, state.login, state.password,
                state.description, state.isObscure, false));
          }
        });
      }
    });
  }
}
