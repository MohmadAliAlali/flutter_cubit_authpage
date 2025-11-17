import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }

  void validateFields({required String email, required String password}) {
    // تفريغ جميع الأخطاء قبل التحقق
    emit(LoginInitial());

    if (email.isEmpty) {
      emit(LoginFieldError(field: "email", message: "Email is required"));
      return;
    }
    if (!email.contains("@")) {
      emit(LoginFieldError(field: "email", message: "Invalid email"));
      return;
    }
    if (password.isEmpty) {
      emit(LoginFieldError(field: "password", message: "Password is required"));
      return;
    }
    if (password.length < 6) {
      emit(LoginFieldError(field: "password", message: "Password too short"));
      return;
    }

    emit(LoginSuccess());
  }
}
