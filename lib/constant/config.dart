import 'package:shared_preferences/shared_preferences.dart';

/// Класс в котором будут храниться данные пользователя после его
/// авторизации в приложении
/// [token] Токен пользователя для работы с API
/// [userName] Имя пользователя
/// [userId] Номер пользователя
/// [passApp] Пароль который пользователь установит для входа в систему
class Config {
  static String token = "";
  static String userName = "";
  static String passApp = "";
  static int userId = -1;

  static void saveUserData() async {
    /**
     * В данной функции будет выполнено сохранение данных в системынй файл.
     * Сохрнять мы будем данные которые нам понадобяться в приложении
     */
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool("isRegistration", true);
    preferences.setString("token", token);
    preferences.setString("userName", userName);
    preferences.setInt("userId", userId);
  }

  static void clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
