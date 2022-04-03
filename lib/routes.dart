import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passmanager/bloc/add_data_user/add_data_bloc.dart';
import 'package:passmanager/bloc/data_info/data_info_cubit.dart';
import 'package:passmanager/bloc/home/home_cubit.dart';
import 'package:passmanager/bloc/show_data/show_data_cubit.dart';
import 'package:passmanager/bloc/sing_in/sing_in_bloc.dart';
import 'package:passmanager/bloc/sing_up/sing_up_bloc.dart';
import 'package:passmanager/bloc/trash/trash_cubit.dart';
import 'package:passmanager/constant/url.dart';
import 'package:passmanager/pages/add_data.dart';
import 'package:passmanager/pages/confirmation_code.dart';
import 'package:passmanager/pages/data_info.dart';
import 'package:passmanager/pages/home.dart';
import 'package:passmanager/pages/show_data.dart';
import 'package:passmanager/pages/sing_in.dart';
import 'package:passmanager/pages/sing_up.dart';
import 'package:passmanager/pages/trash.dart';

/**
 * Класс отвчающией за навигацию в приложении
 */
class AppRouter {
  HomeCubit homeCubit = HomeCubit();

  /// Функция которая возращает верску экрана по заданному пути
  Route<dynamic>? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case singIn:
        {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => SingInBloc(),
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
              builder: (_) =>
                  BlocProvider.value(value: homeCubit, child: Home()));
        }
      case addData:
        {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => AddDataBloc(),
                    child: AddData(),
                  ));
        }
      case showData:
        {
          var dataId = settings.arguments as int;
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                  create: (context) => ShowDataCubit(),
                  child: ShowData(dataId: dataId)));
        }
      case confirmationCode:
        {
          var test = settings.arguments as Map<String, Object?>;
          return MaterialPageRoute(
              builder: (_) => ConfirmationCode(
                    argument: test,
                  ));
        }
      case dataInfo:
        {
          var dataId = settings.arguments as int;
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                  create: (context) => DataInfoCubit(),
                  child: ShowDataInfo(dataId: dataId)));
        }
      case trash:
        {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => TrashCubit(homeCubit),
                    child: TrashPages(),
                  ));
        }
    }
    return null;
  }
}
