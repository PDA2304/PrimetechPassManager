import 'package:flutter/material.dart';
import 'package:passmanager/constant/url.dart';
import 'package:passmanager/pages/data_user.dart';
import 'package:passmanager/pages/home.dart';
import 'package:passmanager/pages/sing_in.dart';
import 'package:passmanager/pages/sing_up.dart';

/*
  Класс отвчающией за навигацию в приложении
 */
class AppRouter {
  // Функция которая возращает верску экрана по заданному пути
  Route<dynamic>? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case singIn:
        {
          return MaterialPageRoute(builder: (_) => SingIn());
        }
      case singUp:
        {
          return MaterialPageRoute(builder: (_) => SingUp());
        }
      case home:
        {
          return MaterialPageRoute(builder: (_) => Home());
        }
      case dataUser:
        {
          return MaterialPageRoute(builder: (_) =>DataUser());
        }
    }
    return null;
  }
}
