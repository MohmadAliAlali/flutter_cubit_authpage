import 'package:flutter/material.dart';
import 'package:task1_cubit/core/font.dart';
import 'package:task1_cubit/core/navigation.dart';
import 'package:task1_cubit/core/responsive.dart';
import 'package:task1_cubit/features/test/presentation/view/login/login_page.dart';
import 'package:task1_cubit/features/test/presentation/view/manager/register/register_cubit.dart';
import 'package:task1_cubit/features/test/presentation/view/virfi_page/virfi_page.dart';
import 'package:task1_cubit/features/test/presentation/view/widget/custom_button.dart';
import 'package:task1_cubit/features/test/presentation/view/widget/custom_password_field.dart';
import 'package:task1_cubit/features/test/presentation/view/widget/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _email = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _password = TextEditingController();

  String? errorField;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterFieldError) {
            errorField = state.field;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Registration successful please virfication email!",
                ),
                backgroundColor: Colors.green,
              ),
            );
            Navigation.navigateAndRemove(context,'/virfi');
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
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Register',
                              style: TaskTextStyle.text72lightGreen,
                            ),

                            CustomTextField(
                              controller: _email,
                              labelText: "Email",
                              width: double.infinity,
                              isError: errorField == "email",
                            ),

                            SizedBox(height: 16),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  controller: _firstName,
                                  labelText: "First Name",
                                  width: 160.w,
                                  isError: errorField == "first",
                                ),
                                SizedBox(width: 16.w),
                                CustomTextField(
                                  controller: _lastName,
                                  labelText: "Last Name",
                                  width: 160.w,
                                  isError: errorField == "last",
                                ),
                              ],
                            ),

                            SizedBox(height: 16),

                            CustomPasswordField(
                              controller: _password,
                              labelText: "Password",
                              width: double.infinity,
                              isError: errorField == "password",
                            ),

                            SizedBox(height: 20),

                            CustomButton(
                              text: "Register",
                              onPressed: () {
                                context.read<RegisterCubit>().validateFields(
                                  email: _email.text,
                                  firstName: _firstName.text,
                                  lastName: _lastName.text,
                                  password: _password.text,
                                );
                              },
                            ),
                            SizedBox(height: 40.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('you dont have any acount'),
                                TextButton.icon(
                                  onPressed: () {
                                    Navigation.navigateTo(context, '/login');
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
