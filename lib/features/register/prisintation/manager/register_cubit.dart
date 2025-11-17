import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();


  // للتحقق من الحقول
  void validateFields({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) {
    
    if (email.isEmpty) {
      emit(RegisterFieldError(field: "email", message: "Email is required"));
      return;
    }
    if (!email.contains("@")) {
      emit(RegisterFieldError(field: "email", message: "Invalid email"));
      return;
    }
    if (firstName.isEmpty) {
      emit(RegisterFieldError(field: "first", message: "First name is required"));
      return;
    }
    if (lastName.isEmpty) {
      emit(RegisterFieldError(field: "last", message: "Last name is required"));
      return;
    }
    if (password.isEmpty) {
      emit(RegisterFieldError(field: "password", message: "Password is required"));
      return;
    }
    if (password.length < 6) {
      emit(RegisterFieldError(field: "password", message: "Password too short"));
      return;
    }

    emit(RegisterSuccess());
  }


  @override
  Future<void> close(){
      email.dispose();
      firstName.dispose();
      lastName.dispose();
      password.dispose();
      return super.close();
    }


}