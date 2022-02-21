import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passmanager/constant/config.dart';
import 'package:passmanager/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant/url.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS)
    await DesktopWindow.setMinWindowSize(const Size(600, 500));

  /// Подключаемся к системному файлы для получения данных
  SharedPreferences preferences = await SharedPreferences.getInstance();

  /// Токен пользователя который находится в системе если пользователь не был
  /// авторизован будет возращен пустой текст
  Config.token = preferences.getString("token") ?? "";

  /// Имя пользователя который находится в системе если пользователь не был
  /// авторизован будет возращен пустой текст
  Config.userName = preferences.getString("userName") ?? "";

  /// Номер пользователя который находится в системе если пользователь не был
  /// авторизваон будет возращено значение -1
  Config.userId = preferences.getInt("userId") ?? -1;

  /// Из системного файла получаем был ли пользователь авторизован
  bool value = preferences.getBool("isRegistration") ?? false;

  runApp(PassManager(
    router: AppRouter(),
    isRegistration: value,
  ));
}

class PassManager extends StatelessWidget {
  final AppRouter router;
  final bool isRegistration;

  PassManager({
    Key? key,
    required this.router,
    this.isRegistration = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRouter,
      initialRoute: isRegistration ? home : singIn,
    );
  }
}
