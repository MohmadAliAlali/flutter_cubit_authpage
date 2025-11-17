import 'package:flutter/material.dart';
import 'package:task1_cubit/core/font.dart';
import 'package:task1_cubit/core/navigation.dart';
import 'package:task1_cubit/core/responsive.dart';
import 'package:task1_cubit/features/login/prisintation/manager/login_cubit.dart';
import 'package:task1_cubit/core/widget/custom_button.dart';
import 'package:task1_cubit/core/widget/custom_password_field.dart';
import 'package:task1_cubit/core/widget/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  String? errorField;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          final password = context.read<LoginCubit>().password;
          final email = context.read<LoginCubit>().email;
          return Scaffold(
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  reverse: true,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.all(24.0.e),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: TaskTextStyle.text72lightGreen,
                            ),
                            CustomTextField(
                              controller: email,
                              labelText: 'Eamil',
                              width: double.infinity,
                              isError: errorField == 'email',
                            ),
                            SizedBox(height: 16.h),
                            CustomPasswordField(
                              controller: password,
                              labelText: 'Password',
                              width: double.infinity,
                              isError: errorField == 'password',
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('if forgite your password ?'),
                                TextButton.icon(
                                  onPressed: () {
                                    Navigation.navigateTo(context, '/rePass');
                                  },
                                  label: Text('rest password'),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),

                            BlocListener<LoginCubit, LoginState>(
                              listener: (context, state) {
                                if (state is LoginFieldError) {
                                  errorField = state.field;
                                  Navigation.noteficationField(
                                    context,
                                    state.message,
                                  );
                                }
                                if (state is LoginSuccess) {
                                  Navigation.noteficationSucs(
                                    context,
                                    'login successful!',
                                  );
                                }
                              },
                              child: CustomButton(
                                text: 'Login',
                                onPressed: () {
                                  context.read<LoginCubit>().validateFields(
                                    email: email.text,
                                    password: password.text,
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 80.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('you dont have any acount'),
                                TextButton.icon(
                                  onPressed: () {
                                    Navigation.navigateTo(context, '/register');
                                  },
                                  label: Text('register'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
