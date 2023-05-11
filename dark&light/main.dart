
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/routes/app.routes.dart';
import 'custome_bloc_providers.dart';
import 'domain/cubit/theme_cubit.dart';

void main() {
  runApp(Core());
}



class Lava extends StatelessWidget {

  final AppRouter router;
  const Lava({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context,listen: true);
    bool isDark = themeCubit.isDark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:isDark ? ThemeData.dark() : ThemeData.light(),
      initialRoute: "/home",
      onGenerateRoute: router.generateRoute,
    );
  }
}

