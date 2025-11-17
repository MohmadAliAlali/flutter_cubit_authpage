


part of 'user_cubit.dart';


@immutable
abstract class UsersState {
  const UsersState();
}

class UsersLoading extends UsersState {}

class UsersSuccess extends UsersState {
  final List<UserModel> users;
  const UsersSuccess(this.users);
}

class UsersError extends UsersState {
  final String msg;
  const UsersError(this.msg);
}