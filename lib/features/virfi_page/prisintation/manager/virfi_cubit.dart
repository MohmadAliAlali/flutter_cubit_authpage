import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'virfi_state.dart';

class VirfiCubit extends Cubit<VirfiState> {
  VirfiCubit() : super(VirfiInitial());

  final code = TextEditingController();

  @override
  Future<void> close() {
    code.dispose();
    return super.close();
  }
  void validateFields({
    required String code,
  }) {
    // تفريغ جميع الأخطاء قبل التحقق
    emit(VirfiInitial());

    if (code.isEmpty) {
      emit(VirfiFieldError(field: "code", message: "Code is required"));
      return;
    }
    if (code.length!=6) {
      emit(VirfiFieldError(field: "code", message: "Code is only 6 Chracter"));
      return;
    }


    emit(VirfiSuccess());
  }
}