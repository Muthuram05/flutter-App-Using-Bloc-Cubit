import 'package:bloc_app/domain/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
       title:  BlocBuilder<ThemeCubit,ThemeState>(
          builder:(context,state){
            if(state is ThemeDark){
              return Text(state.message);
            }
            if(state is ThemeLight){
              return Text(state.message);
            }
            return Text("");
          },
        ),
      ),
        body: BlocListener<ThemeCubit,ThemeState>(
          listener: (context,state){
            if(state is ThemeDark){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message),duration:Duration(seconds: 1)
                  )
              );
            }
            if(state is ThemeLight){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message),duration:Duration(seconds: 1),
                  )
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    themeCubit.toogleTheme();
                  },
                  child: Text("Click Me"),
                ),
              ),

            ],
          )
        )
    );
  }
}
