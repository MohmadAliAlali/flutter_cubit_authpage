import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/features/test/presentation/view/manager/user_cubit/user_cubit.dart';
import 'package:task1_cubit/server/repo/api_service.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // اقرأ الـ ApiService من الـ context الحالي (الذي فوق الصفحة)
    final api = context.read<ApiService>();

    return BlocProvider(
      create: (_) => UsersCubit(api)..fetchUsers(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Users (Mock)')),
        body: BlocBuilder<UsersCubit, UsersState>(
          builder: (_, state) {
            if (state is UsersLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UsersError) {
              return Center(child: Text(state.msg));
            }
            if (state is UsersSuccess) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (_, i) {
                  final u = state.users[i];
                  return ListTile(title: Text(u.name), subtitle: Text(u.email));
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}