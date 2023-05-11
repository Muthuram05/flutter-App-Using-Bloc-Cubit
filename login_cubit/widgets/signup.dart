import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/login_cubit.dart';
import '../home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

final _formKey = GlobalKey<FormState>();
final userController = TextEditingController();
final passController = TextEditingController();
final phone = TextEditingController();
final address = TextEditingController();

class _SignUpState extends State<SignUp> {
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
          child: SingleChildScrollView(
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
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.nest_cam_wired_stand),
                          hintText: "Name"
                      ),
                      validator: (value) {
                        if(value == null){
                          return 'Enter some text';
                        }
                        if (value.isEmpty) {
                          return 'Please enter Your Name';
                        }
                        if(value.length < 4){
                          return 'Low';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.phone),
                          hintText: "PhoneNo"
                      ),
                      validator: (value) {
                        if(value == null){
                          return 'Enter some text';
                        }
                        if (value.isEmpty) {
                          return 'Please enter Phone Number';
                        }
                        if(value.length < 10){
                          return 'Low';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: address,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.home),
                          hintText: "Address"
                      ),
                      validator: (value) {
                        if(value == null){
                          return 'Enter some text';
                        }
                        if (value.isEmpty) {
                          return 'Please enter Your Address';
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
                          context.read<LoginCubit>().signUp(userController.text,passController.text);
                        }
                      },
                      child: const Text('SignUp'),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
