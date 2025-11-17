import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/features/test/data/user_model.dart';
import 'package:task1_cubit/server/repo/api_service.dart';


part 'user_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._api) : super(UsersLoading());

  final ApiService _api;   // حقنه من فوق (BlocProvider)

  Future<void> fetchUsers() async {
    try {
      final rawList = await _api.getUsers();
      final users = rawList.map((e) => UserModel.fromJson(e)).toList();
      emit(UsersSuccess(users));
    } catch (e) {
      emit(UsersError(e.toString()));
    }
  }
}