import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passmanager/bloc/sing_in/sing_in_form_bloc.dart';
import 'package:passmanager/bloc/sing_up/sing_up_bloc.dart';
import 'package:passmanager/constant/url.dart';
import 'package:passmanager/pages/add_data.dart';
import 'package:passmanager/pages/data_user.dart';
import 'package:passmanager/pages/home.dart';
import 'package:passmanager/pages/show_data.dart';
import 'package:passmanager/pages/sing_in.dart';
import 'package:passmanager/pages/sing_up.dart';
import 'bloc/home/home_bloc.dart';

/**
 * Класс отвчающией за навигацию в приложении
 */
class AppRouter {
  /// Функция которая возращает верску экрана по заданному пути
  Route<dynamic>? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case singIn:
        {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => SingInFormBloc(),
                    child: SingIn(),
                  ));
        }
      case singUp:
        {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => SingUpBloc(),
                    child: SingUp(),
                  ));
        }
      case home:
        {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => HomeBloc(),
                    child: Home(),
                  ));
        }
      case dataUser:
        {
          return MaterialPageRoute(builder: (_) => DataUser());
        }
      case addData:
        {
          return MaterialPageRoute(builder: (_) => AddData());
        }
      case showData:
        {
          return MaterialPageRoute(builder: (_) => ShowData());
        }
    }
    return null;
  }
}
