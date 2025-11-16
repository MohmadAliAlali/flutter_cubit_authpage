import 'package:flutter/material.dart';
import 'package:task1_cubit/core/font.dart';
import 'package:task1_cubit/core/navigation.dart';
import 'package:task1_cubit/core/responsive.dart';
import 'package:task1_cubit/features/test/presentation/view/login/login_page.dart';
import 'package:task1_cubit/features/test/presentation/view/manager/virfi/virfi_cubit.dart';
import 'package:task1_cubit/features/test/presentation/view/widget/custom_button.dart';
import 'package:task1_cubit/features/test/presentation/view/widget/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class VirfiPage extends StatelessWidget {
  VirfiPage({super.key});
  final _code = TextEditingController();

  String? errorField;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VirfiCubit(),
      child: BlocConsumer<VirfiCubit, VirfiState>(
        listener: (context, state) {
          if (state is VirfiFieldError) {
            errorField = state.field;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state is VirfiSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Virfi your email sucsses !"),
                backgroundColor: Colors.green,
              ),
            );
            // Navigation.navigateTo(context, RestPasswordPage());
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
                              'Virfication Code',
                              style: TaskTextStyle.text65lightGreen,
                            ),
                            CustomTextField(
                              controller: _code,
                              labelText: 'Virfication code',
                              width: double.infinity,
                              isError: errorField == 'code',
                            ),
                            SizedBox(height: 12.h),
                            CustomButton(
                              text: 'Virfication',
                              onPressed: () {
                                context.read<VirfiCubit>().validateFields(
                                  code: _code.text,
                                );
                              },
                            ),
                            SizedBox(height: 80.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('resend virfication code '),
                                TextButton.icon(
                                  onPressed: () {
                                    Navigation.navigateTo(context, '/login');
                                  },
                                  label: Text('send'),
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
