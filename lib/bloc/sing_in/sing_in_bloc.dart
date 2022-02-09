import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:passmanager/constant/config.dart';
import 'package:passmanager/data/network_service.dart';

part 'sing_in_event.dart';

part 'sing_in_state.dart';

/// Класс отвечающий за логику экрана авторизации
class SingInBloc extends Bloc<SingInEvent, SingInState> {
  SingInBloc() : super(Copy(true, false, '', '')) {
    on<SingInEvent>((event, emit) async {
      var network = NetworkService();

      /**
       *  Если сработало событие отобразить или скрыть пароль то будет запущено
       *  данное условие. После этого отправятся данные в состояния для их
       *  изменения и дальнешего хранения.
       */
      if (event is ChangedObscure) {
        emit(Copy(event.isObscure, state.isLoad, state.login, state.password));
      }

      /**
       * Если сработало событие то данные которые находятся в event отправляются
       * в состояния для их хранения. Данное условие срабатывает, когда
       * пользователь вводит логин
       */
      if (event is OnChangedLogin) {
        emit(Copy(state.isObscure, state.isLoad, event.login, state.password));
      }

      /**
       * Если сработало событие то данные которые находятся в event отправляются
       * в состояния для их хранения. Данное условие срабатывает, когда
       * пользователь вводит пароль
       */
      if (event is OnChangedPassword) {
        emit(Copy(state.isObscure, state.isLoad, state.login, event.password));
      }

      /**
       * Если сработало событие то данные которые находятся в event отправляются
       * в состояния для их хранения. Данное условие срабатывает, когда
       * пользователь нажал на кнопку авторизации. В этот момент отправляются
       * данные по API
       */
      if (event is OnResponse) {
        /**
         * Отправка данных если value.containsKey 200 то пользователь успешно
         * авторизовался и сохраняется состояния для перехода на новый экран
         * если value.containsKey 422 то пользователь совершил валидационную
         * ошибку в ответе от API придет что за ошибка. Ошибка сохраняется и
         * выводится на экран
         */
        await network.singIn(state.login, state.password).then((value) async {
          if (value.containsKey(200)) {
            /// Добавляем данные в системный файл после авторизации пользователя
            Config.token = value[200]["token"];
            Config.userName = value[200]["user_name"];
            Config.userId = value[200]["id"];
            Config.saveUserData();

            emit(Succes(true));
          }
          if (value.containsKey(422)) {
            emit(Response(
                value, state.login, state.password, state.isObscure, false));
          }
        });
      }

      /**
       *  Условие запускается когда пользователь нажимал на кнопку авторизовации.
       *  Данный процесс запускает CircularProgressIndicator
       */
      if (event is OnLoad) {
        emit(Copy(state.isObscure, event.isLoad, state.login, state.password));
      }

      /**
       *  Условие запускается когда пользователь нажал на логитип для перехода
       *  в панель администратора. После нажатия запускается счетчик если
       *  счетчик достигнет 10 до откроется диалоговое окна для ввода
       *  пароля администратора. Когда счетчик достиг 10 мы его сбрасываем
       */
      if (event is OnAdminClick) {
        int count = state.countAdmin + 1;
        emit(Admin(count, state.login, state.password));
        if (count == 10) {
          emit(Admin(0, state.login, state.password));
        }
      }
    });
  }
}
