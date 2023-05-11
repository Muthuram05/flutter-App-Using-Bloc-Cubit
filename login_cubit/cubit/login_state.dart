part of 'login_cubit.dart';

class LoginState{}

class LoginInitial extends LoginState{}

class FormFailed extends LoginState{
  final String message;
  FormFailed({required this.message});
}

class FormSucesed extends LoginState{
  final String user,pass;
  FormSucesed({required this.user,required this.pass});
}