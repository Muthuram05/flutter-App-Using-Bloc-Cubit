import 'package:bloc_app/todo/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()));
                    }, child: const Text("Login")
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUp()));
                    },
                    child: const Text("SignUp")
                ),
              ],
            ),
          ),
       ),
    );
  }
}
