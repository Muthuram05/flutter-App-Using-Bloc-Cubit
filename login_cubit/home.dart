
import 'package:bloc_app/login_cubit/cubit/login_cubit.dart';
import 'package:bloc_app/todo/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit,LoginState>(
      builder: (context,state){
        return Scaffold(
          body: Center(
            child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage("https://static.vecteezy.com/system/resources/previews/000/439/863/original/vector-users-icon.jpg"),
                    ),
                    SizedBox(height: 10,),
                    Text(""),
                    SizedBox(height: 10,),
                    Text(""),
                    SizedBox(height: 10,),
                    Text(""),
                    SizedBox(height: 10,),
                    Text(""),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){}, child: Text("Edit Profile"))
                  ],
                )
            ),
          ),
        );
      },
    );
  }
}
