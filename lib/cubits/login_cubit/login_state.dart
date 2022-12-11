part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginProgress extends LoginState {}

class LoginSuccess extends LoginState {

  LoginSuccess({required this.email, required this.password});

  final String email;
  final String password;
}

class LoginError extends LoginState {
  LoginError({required this.errorText});

  final String errorText;
}
