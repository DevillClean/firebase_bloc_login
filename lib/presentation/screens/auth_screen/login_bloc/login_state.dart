part of 'login_bloc.dart';


@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginError extends LoginState {}

class LoginSucces extends LoginState {}
