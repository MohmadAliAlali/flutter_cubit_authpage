import 'package:flutter_bloc/flutter_bloc.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPaswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  void validateFields({
    required String email,
    required String password,
  }) {
    // تفريغ جميع الأخطاء قبل التحقق
    emit(ResetPasswordInitial());

    if (email.isEmpty) {
      emit(ResetPasswordFieldError(field: "email", message: "Email is required"));
      return;
    }
    if (!email.contains("@")) {
      emit(ResetPasswordFieldError(field: "email", message: "Invalid email"));
      return;
    }
    if (password.isEmpty) {
      emit(ResetPasswordFieldError(field: "password", message: "Password is required"));
      return;
    }
    if (password.length < 6) {
      emit(ResetPasswordFieldError(field: "password", message: "Password too short"));
      return;
    }

    emit(ResetPasswordSuccess());
  }
}