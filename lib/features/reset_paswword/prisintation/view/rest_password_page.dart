import 'package:flutter/material.dart';
import 'package:task1_cubit/core/font.dart';
import 'package:task1_cubit/core/navigation.dart';
import 'package:task1_cubit/core/responsive.dart';
import 'package:task1_cubit/features/reset_paswword/prisintation/manager/reset_password_cubit.dart';
import 'package:task1_cubit/core/widget/custom_button.dart';
import 'package:task1_cubit/core/widget/custom_password_field.dart';
import 'package:task1_cubit/core/widget/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RestPasswordPage extends StatelessWidget {
  RestPasswordPage({super.key});
  final _email = TextEditingController();
  final _password = TextEditingController();

  String? errorField;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPaswordState>(
        listener: (context, state) {
          if (state is ResetPasswordFieldError) {
            errorField = state.field;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Virfi your email"),
                backgroundColor: Colors.green,
              ),
            );
            Navigation.navigateTo(context, '/virfi');
          }
        },
        builder: (context, state) {
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
                              'Reset Password',
                              style: TaskTextStyle.text65lightGreen,
                            ),
                            CustomTextField(
                              controller: _email,
                              labelText: 'Eamil',
                              width: double.infinity,
                              isError: errorField == 'email',
                            ),
                            SizedBox(height: 16.h),
                            CustomPasswordField(
                              controller: _password,
                              labelText: 'New Password',
                              width: double.infinity,
                              isError: errorField == 'password',
                            ),
                            SizedBox(height: 12.h),
                            CustomButton(
                              text: 'Reset Password',
                              onPressed: () {
                                context
                                    .read<ResetPasswordCubit>()
                                    .validateFields(
                                      email: _email.text,
                                      password: _password.text,
                                    );
                              },
                            ),
                            SizedBox(height: 80.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(' i want back to '),
                                TextButton.icon(
                                  onPressed: () {
                                    Navigation.navigateTo(context, '/login');
                                  },
                                  label: Text('login'),
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
