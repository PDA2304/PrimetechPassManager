import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:passmanager/bloc/sing_in/sing_in_bloc.dart';
import 'package:passmanager/data/network_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sing_up_event.dart';

part 'sing_up_state.dart';

/**
 * Класс отвечающий за логику регистрации
 */
class SingUpBloc extends Bloc<SingUpEvent, SingUpState> {
  SingUpBloc()
      : super(Copy(
          '',
          '',
          '',
          true,
          {
            422: {
              "user_name": [null],
              "login": [null],
              "password": [null]
            }
          },
          false,
        )) {
    on<SingUpEvent>((event, emit) async {
      var network = NetworkService();

      /// Ввод Пароля
      if (event is OnChangedPassword) {
        emit(Copy(state.userName, state.login, event.password, state.isObscure,
            state.response, state.isLoad));
      }

      /// Ввод Логина
      if (event is OnChangedLogin) {
        emit(Copy(state.userName, event.login, state.password, state.isObscure,
            state.response, state.isLoad));
      }

      /// Ввод имени
      if (event is OnChangedUserName) {
        emit(Copy(event.userName, state.login, state.password, state.isObscure,
            state.response, state.isLoad));
      }

      /// В этот момент запускается CircleProgressBar
      if (event is OnLoad) {
        emit(Copy(state.userName, state.login, state.password, state.isObscure,
            state.response, event.isLoad));
      }

      /// Отправка данных для регистрации
      if (event is OnResponse) {
        await network
            .singUp(state.userName, state.login, state.password)
            .then((value) async {
          print(value);

          /// Ошибка ввода данных
          if (value.containsKey(422)) {
            emit(Response(value, state.userName, state.login, state.password,
                state.isObscure, false, false));
          }

          /// Ответ получен успешно
          if (value.containsKey(200)) {
            /// Добавляем в системный файл что пльзователь авторизовался
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setBool("isRegistration", true);
            emit(Succes(true, true));
          }
        });
      }

      /// Скрытие и показа пароля
      if (event is ChangedObscure) {
        emit(Copy(state.userName, state.login, state.password, event.isObscure,
            state.response, state.isLoad));
      }
    });
  }
}
