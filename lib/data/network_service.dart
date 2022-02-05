import 'package:dio/dio.dart';
import 'package:passmanager/data/model/Employee.dart';

/**
 * Класс отвечающий за запросы к API
 * [dio] Класс который работыет с API
 * [baseUrl] Ссылка к API
 */
class NetworkService {
  final dio = Dio();
  String baseUrl = "http://172.18.78.77:8888/api/";

  /**
   * Функция регистрации
   * если возращается 200 регистрация прошла успешно
   * если возращается 422 регистрация провалена из-за валидации
   * [userName] Имя пользователя
   * [login] Логин пользвоателя
   * [password] пароль пользователя
   */
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
}
