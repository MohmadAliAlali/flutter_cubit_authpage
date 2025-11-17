
part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFieldError extends LoginState {
  final String field;   // email /  password
  final String message;

  LoginFieldError({
    required this.field,
    required this.message,
  });
}




