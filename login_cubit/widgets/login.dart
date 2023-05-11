import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/login_cubit.dart';
import '../home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
final _formKey = GlobalKey<FormState>();
final userController = TextEditingController();
final passController = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<LoginCubit,LoginState>(
          listener: (context,state) {
            if (state is FormSucesed) {
             Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
            }
            if (state is FormFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            }
          },
          child: Card(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40,),
                  TextFormField(
                    controller: userController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: "User Name"
                    ),
                    validator: (value) {
                      if(value == null){
                        return 'Enter some text';
                      }
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if(value.length < 5){
                        return 'Low';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: passController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.security),
                        hintText: "Password"
                    ),
                    validator: (value) {
                      if(value == null){
                        return 'Enter some text';
                      }
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if(value.length < 5){
                        return 'Low';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40,),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginCubit>().login(userController.text,passController.text);
                      }
                    },
                    child: const Text('Login'),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
