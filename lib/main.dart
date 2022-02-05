import 'package:flutter/material.dart';
import 'package:passmanager/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant/url.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// Подключаемся к системному файлы для получения данных
  SharedPreferences preferences = await SharedPreferences.getInstance();
  if (preferences.getBool("isRegistration") == null) {
    /// Если приложение было только установлено то ключ со значем
    /// был ли пользователь авторизован
    preferences.setBool("isRegistration", false);
  }
  /// Из системного файла получем был ли пользователь авторизован
  bool value = preferences.getBool("isRegistration")!;
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
