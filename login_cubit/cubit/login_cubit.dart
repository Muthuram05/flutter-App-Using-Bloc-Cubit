import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'login_state.dart';


class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginInitial());
  void login(currentUser,currentUserPass) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: currentUser, password: currentUserPass
      );
      emit(FormSucesed(user: currentUser,pass: currentUserPass ));
    }
    on FirebaseException catch(e){
      emit(FormFailed(message: e.message.toString()));
    }
  }
  void signUp(currentUser,currentUserPass) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: currentUser, password: currentUserPass
      );
      final user = FirebaseAuth.instance.currentUser!;
      final docUser = FirebaseFirestore.instance.collection('users').doc(user.uid!);
      final json = {
        'name' : "User",
        'age' : "00/00/0000",
        'contact' : "0000000000",

      };
      await docUser.set(
          json
      );
      emit(FormSucesed(user: currentUser,pass: currentUserPass ));
    }
    on FirebaseException catch(e){
      emit(FormFailed(message: e.message.toString()));
    }
  }
}