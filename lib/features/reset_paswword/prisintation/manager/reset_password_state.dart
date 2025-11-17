
part of 'reset_password_cubit.dart';

abstract class ResetPaswordState {}

class ResetPasswordInitial extends ResetPaswordState {}

class ResetPasswordSuccess extends ResetPaswordState {}

class ResetPasswordFieldError extends ResetPaswordState {
  final String field;   // email /  password
  final String message;

  ResetPasswordFieldError({
    required this.field,
    required this.message,
  });
}
