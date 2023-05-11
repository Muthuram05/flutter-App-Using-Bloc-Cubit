
import 'package:bloc_app/dark&light/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/routes/app.routes.dart';
import 'domain/cubit/theme_cubit.dart';

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