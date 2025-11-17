import 'package:flutter/material.dart';
import 'package:task1_cubit/core/font.dart';
import 'package:task1_cubit/core/navigation.dart';
import 'package:task1_cubit/core/responsive.dart';
import 'package:task1_cubit/features/register/prisintation/manager/register_cubit.dart';
import 'package:task1_cubit/core/widget/custom_button.dart';
import 'package:task1_cubit/core/widget/custom_password_field.dart';
import 'package:task1_cubit/core/widget/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          final cubit = context.read<RegisterCubit>();
          final email = cubit.email;
          final firstName = cubit.firstName;
          final lastName = cubit.lastName;
          final password = cubit.password;
          return Scaffold(
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  reverse: true,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
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
                            controller: email,
                            labelText: "Email",
                            width: double.infinity,
                            isError:
                                state is RegisterFieldError &&
                                state.field == "email",
                          ),

                          SizedBox(height: 16),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextField(
                                controller: firstName,
                                labelText: "First Name",
                                width: 160.w,
                                isError:
                                    state is RegisterFieldError &&
                                    state.field == "first",
                              ),
                              SizedBox(width: 16.w),
                              CustomTextField(
                                controller: lastName,
                                labelText: "Last Name",
                                width: 160.w,
                                isError:
                                    state is RegisterFieldError &&
                                    state.field == "last",
                              ),
                            ],
                          ),

                          SizedBox(height: 16),

                          CustomPasswordField(
                            controller: password,
                            labelText: "Password",
                            width: double.infinity,
                            isError:
                                state is RegisterFieldError &&
                                state.field == "password",
                          ),

                          SizedBox(height: 20),
                          BlocListener<RegisterCubit, RegisterState>(
                            listener: (context, state) {
                              if (state is RegisterFieldError) {
                                Navigation.noteficationField(
                                  context,
                                  state.message,
                                );
                              }
                              if (state is RegisterSuccess) {
                                Navigation.noteficationSucs(
                                  context,
                                  "Registration successful please virfication email!",
                                );
                                // Navigation.navigateAndRemove(
                                //   context,
                                //   '/virfi',
                                // );
                              }
                            },
                            child: CustomButton(
                              text: "Register",
                              onPressed: () {
                                context.read<RegisterCubit>().validateFields(
                                  email: email.text,
                                  firstName: firstName.text,
                                  lastName: lastName.text,
                                  password: password.text,
                                );
                              },
                            ),
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
                );
              },
            ),
          );
        },
      ),
    );
  }
}
