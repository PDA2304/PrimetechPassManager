import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:passmanager/pages/home.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(DataState(title: "Данные")) {
    on<HomeEvent>((event, emit) {
      if (event is LoadChanged) {
        switch (event.index) {
          case 0:
            emit(DataState());
            break;
          case 1:
            emit(DataUserState());
            break;
          case 2:
            emit(SettingsState());
            break;
        }
      }
    });
  }
}
