import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:r_gol/presentation/assets/app_assets.dart';
import 'package:r_gol/presentation/screens/auth/sign_in/cubit/sign_in_action.dart';
import 'package:r_gol/presentation/screens/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:r_gol/presentation/screens/auth/sign_in/cubit/sign_in_state.dart';
import 'package:r_gol/presentation/screens/auth/widgets/create_account_button.dart';
import 'package:r_gol/presentation/screens/auth/widgets/forgot_password_button.dart';
import 'package:r_gol/presentation/screens/auth/widgets/header_auth.dart';
import 'package:r_gol/presentation/screens/auth/widgets/other_options_to_login.dart';
import 'package:r_gol/presentation/screens/auth/widgets/socials_button.dart';
import 'package:r_gol/presentation/theme/app_colors.dart';
import 'package:r_gol/presentation/theme/app_dimens.dart';
import 'package:r_gol/presentation/theme/app_spacings.dart';
import 'package:r_gol/presentation/theme/app_typography.dart';
import 'package:r_gol/presentation/widgets/button/basic_button.dart';
import 'package:r_gol/presentation/screens/auth/widgets/password_field.dart';

class SignInPage extends HookWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SignInCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener(cubit, (action) {
      switch (action) {
        case SignInSuccess():
          //context.go(AppRoutes.home)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Login successfully.',
                style: AppTypography.h4.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.primary,
            ),
          );
        case SignInShowLoading():
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.purple),
              );
            },
          );
        case SignInHideLoading():
          Navigator.of(context).pop();
        case SignInShowErrorMessage(:final message):
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

    final passwordController = useTextEditingController();
    final emailController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: switch (state) {
            SignInInitial(:final errorMessage) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.xl),
              child: Column(
                children: [
                  HeaderAuth(
                    mainText: 'Sign In',
                    subtitleText: 'Welcome back! Please login.',
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
                  const AppSpacings.medium(),
                  if (errorMessage != null)
                    Text(
                      errorMessage,
                      style: TextStyle(color: AppColors.error),
                    ),
                  const AppSpacings.medium(),
                  BasicButton(
                    onPressed: () {
                      cubit.getSignIn(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                    text: 'Login to Account',
                  ),
                  AppSpacings.small(),
                  ForgotPasswordButton(),
                  AppSpacings.medium(),
                  CreateAccountButton(),
                  AppSpacings.xLarge(),
                  OtherOptionsToLogin(),
                  AppSpacings.xLarge(),
                  SocialsButton(
                    text: 'Sign in with Google',
                    assetName: AppAssets.googleIcon,
                    onPressed: () {
                      cubit.loginWithGoogle();
                    },
                  ),
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
