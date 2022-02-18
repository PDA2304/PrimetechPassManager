import 'package:dio/dio.dart';
import 'package:passmanager/constant/config.dart';
import 'package:passmanager/data/model/Data.dart';
import 'package:passmanager/data/model/Employee.dart';

/// Класс отвечающий за запросы к API
/// [dio] Класс который работыет с API
/// [baseUrl] Ссылка к API
class NetworkService {
  final dio = Dio();
  String baseUrl = "http://52.170.99.226:8888/api/";

  /// Функция регистрации
  /// если возращается 200 регистрация прошла успешно
  /// если возращается 422 регистрация провалена из-за валидации
  /// [userName] Имя пользователя
  /// [login] Логин пользвоателя
  /// [password] пароль пользователя
  Future<Map<int, dynamic>> singUp(
    String userName,
    String login,
    String password,
  ) async {
    var request = Employee(
      userName: userName,
      login: login,
      password: password,
    ).toJson();
    try {
      final response = await dio.post("${baseUrl}sing_up", data: request);
      return {200: response.data};
    } on DioError catch (e) {
      return {422: Employee().toError(e.response!.data)};
    }
  }

  /// Функция Авторизации
  /// если возращается 200 авторизация прошла успешно
  /// если возращается 422 авторизация провалена из-за валидации
  /// [login] Логин пользвоателя
  /// [password] пароль пользователя
  Future<Map<int, dynamic>> singIn(
    String login,
    String password,
  ) async {
    var request = Employee(
      login: login,
      password: password,
    ).toJson();
    try {
      final response = await dio.post("${baseUrl}sing_in", data: request);
      return {200: response.data};
    } on DioError catch (e) {
      return {422: Employee().toError(e.response!.data)};
    }
  }

  ///  Функция Добаление данных ползователя
  ///  ecли возращается 200 до успешное добавление данных
  ///  если возращается 422 произошла ошибка валидации данных
  ///  [name] Название данных
  ///  [login] логин данных
  ///  [password] пароль данных
  ///  [description] описание данных
  Future<Map<int, dynamic>> addData(
    String name,
    String login,
    String password,
    String description,
  ) async {
    var request = Data(
      name: name,
      login: login,
      password: password,
      description: description,
      userId: Config.userId,
    ).toJsonAdd();
    try {
      final response = await dio.post("${baseUrl}data", data: request);
      return {200: response.data};
    } on DioError catch (e) {
      return {422: Data().toError(e.response!.data)};
    }
  }
}
