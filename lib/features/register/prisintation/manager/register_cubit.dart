import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/features/register/data/local/user_local_storage.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._local) : super(RegisterInitial());
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final UserLocalStorage _local;

  // للتحقق من الحقول
  void validateFields({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    if (email.isEmpty) {
      emit(RegisterFieldError(field: "email", message: "Email is required"));
      return;
    }
    if (!email.contains("@")) {
      emit(RegisterFieldError(field: "email", message: "Invalid email"));
      return;
    }
    if (firstName.isEmpty) {
      emit(
        RegisterFieldError(field: "first", message: "First name is required"),
      );
      return;
    }
    if (lastName.isEmpty) {
      emit(RegisterFieldError(field: "last", message: "Last name is required"));
      return;
    }
    if (password.isEmpty) {
      emit(
        RegisterFieldError(field: "password", message: "Password is required"),
      );
      return;
    }
    if (password.length < 6) {
      emit(
        RegisterFieldError(field: "password", message: "Password too short"),
      );
      return;
    }
    await _local.saveUser(
      id: '1',
      name: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
    emit(RegisterSuccess());
  }

  @override
  Future<void> close() {
    email.dispose();
    firstName.dispose();
    lastName.dispose();
    password.dispose();
    return super.close();
  }
}
