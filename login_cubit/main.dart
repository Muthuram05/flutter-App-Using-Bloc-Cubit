import 'package:bloc_app/login_cubit/widgets/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/login_cubit.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDY4ISbtTy12qzox3rZ3QX2NDeWdrUR5LE",
        authDomain: "flutterbloc-d0adc.firebaseapp.com",
        projectId: "flutterbloc-d0adc",
        storageBucket: "flutterbloc-d0adc.appspot.com",
        messagingSenderId: "53512485722",
        appId: "1:53512485722:web:7a6c02a76ad033bfb3d163"
    )
  );
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Auth()
      ),
    );
  }
}