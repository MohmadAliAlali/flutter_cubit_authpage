import 'package:flutter/material.dart';
import 'package:task1_cubit/core/font.dart';
import 'package:task1_cubit/core/navigation.dart';
import 'package:task1_cubit/core/responsive.dart';
import 'package:task1_cubit/features/test/presentation/view/register/resgister_page.dart';
import 'package:task1_cubit/features/test/presentation/view/manager/login/login_cubit.dart';
import 'package:task1_cubit/features/test/presentation/view/reset_paswword/rest_password_page.dart';
import 'package:task1_cubit/features/test/presentation/view/widget/custom_button.dart';
import 'package:task1_cubit/features/test/presentation/view/widget/custom_password_field.dart';
import 'package:task1_cubit/features/test/presentation/view/widget/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _email = TextEditingController();
  final _password = TextEditingController();

  String? errorField;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFieldError) {
            errorField = state.field;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login successful!"),
                backgroundColor: Colors.green,
              ),
            );
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
                              'Login',
                              style: TaskTextStyle.text72lightGreen,
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
                                    Navigation.navigateTo(
                                      context,
                                      '/rePass',
                                    );
                                  },
                                  label: Text('rest password'),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            CustomButton(
                              text: 'Login',
                              onPressed: () {
                                context.read<LoginCubit>().validateFields(
                                  email: _email.text,
                                  password: _password.text,
                                );
                              },
                            ),
                            SizedBox(height: 80.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('you dont have any acount'),
                                TextButton.icon(
                                  onPressed: () {
                                    Navigation.navigateTo(
                                      context,
                                      '/register',
                                    );
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
