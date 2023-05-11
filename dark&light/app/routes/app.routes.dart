import 'package:flutter/material.dart';
import '../../domain/cubit/theme_cubit.dart';
import '../../presentation/views/home/home.view.dart';


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