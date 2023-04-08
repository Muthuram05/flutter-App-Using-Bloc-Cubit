import 'package:bloc_app/app/routes/app.routes.dart';
import 'package:bloc_app/domain/cubit/theme_cubit.dart';
import 'package:bloc_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(create:(context) => ThemeCubit()),

        ], child: Lava(
      router: AppRouter(),
    ));
  }
}