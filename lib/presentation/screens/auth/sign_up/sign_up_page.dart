import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:r_gol/presentation/screens/auth/sign_up/cubit/sign_up_action.dart';
import 'package:r_gol/presentation/screens/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:r_gol/presentation/screens/auth/sign_up/cubit/sign_up_state.dart';
import 'package:r_gol/presentation/screens/auth/widgets/header_auth.dart';
import 'package:r_gol/presentation/screens/auth/widgets/login_button.dart';
import 'package:r_gol/presentation/theme/app_colors.dart';
import 'package:r_gol/presentation/theme/app_dimens.dart';
import 'package:r_gol/presentation/theme/app_spacings.dart';
import 'package:r_gol/presentation/theme/app_typography.dart';
import 'package:r_gol/presentation/widgets/button/basic_button.dart';
import 'package:r_gol/presentation/screens/auth/widgets/password_field.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SignUpCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener(cubit, (action) {
      switch (action) {
        case SignUpSuccess():
          //context.go(AppRoutes.homePage);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Registered successfully.',
                style: AppTypography.h4.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.primary,
            ),
          );
        case SignUpShowLoading():
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Center(child: CircularProgressIndicator(color: AppColors.purple,));
            },
          );
        case SignUpHideLoading():
          Navigator.of(context).pop();
        case SignUpShowErrorMessage(:final message):
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                style: AppTypography.h4.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.error,
            ),
          );
      }
    });

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: switch (state) {
            SignUpInitial(:final errorMessage) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.xl),
              child: Column(
                children: [
                  HeaderAuth(
                    mainText: 'Sign Up',
                    subtitleText: 'Create an account to continue.',
                  ),
                  AppSpacings.xLarge(),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      error: errorMessage != null ? SizedBox.shrink() : null,
                    ),
                    controller: emailController,
                  ),
                  AppSpacings.medium(),
                  PasswordField(
                    text: 'Password',
                    controller: passwordController,
                    hasError: errorMessage != null,
                  ),
                  AppSpacings.medium(),
                  PasswordField(
                    text: 'Confirm password',
                    controller: confirmPasswordController,
                    hasError: errorMessage != null,
                  ),
                  const AppSpacings.medium(),
                  if (errorMessage != null)
                    Text(
                      errorMessage,
                      style: TextStyle(color: AppColors.error),
                    ),
                  const AppSpacings.medium(),
                  BasicButton(
                    onPressed: () {
                      cubit.signUpWithEmail(
                        emailController.text,
                        passwordController.text,
                        confirmPasswordController.text,
                      );
                    },
                    text: 'Create Account',
                  ),
                  AppSpacings.medium(),
                  LoginButton(),
                ],
              ),
            ),
            _ => Center(child: CircularProgressIndicator()),
          },
        ),
      ),
    );
  }
}
