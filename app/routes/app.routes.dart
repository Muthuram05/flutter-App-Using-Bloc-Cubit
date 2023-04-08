import 'package:bloc_app/domain/cubit/theme_cubit.dart';
import 'package:bloc_app/presentation/views/home/home.view.dart';
import 'package:flutter/material.dart';


class AppRouter{
  late ThemeCubit themeCubit;

  AppRouter(){
    themeCubit = ThemeCubit();
  }

  Route? generateRoute(RouteSettings settings){
    switch (settings.name){
      case "/home" :{
        return MaterialPageRoute(builder: (context) => HomeView());
      }
    }
    return null;
  }

}