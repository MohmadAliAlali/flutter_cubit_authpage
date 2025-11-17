
part of 'virfi_cubit.dart';

abstract class VirfiState {}

class VirfiInitial extends VirfiState {}

class VirfiSuccess extends VirfiState {}

class VirfiFieldError extends VirfiState {
  final String field;   // email /  password
  final String message;

  VirfiFieldError({
    required this.field,
    required this.message,
  });
}
