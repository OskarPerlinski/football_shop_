import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:r_gol/presentation/screens/auth/widgets/header_auth.dart';
import 'package:r_gol/presentation/screens/auth/widgets/login_button.dart';
import 'package:r_gol/presentation/theme/app_dimens.dart';
import 'package:r_gol/presentation/theme/app_spacings.dart';
import 'package:r_gol/presentation/widgets/button/basic_button.dart';
import 'package:r_gol/presentation/widgets/password_field/password_field.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.xl),
            child: Column(
              children: [
                HeaderAuth(
                  mainText: 'Sign Up',
                  subtitleText: 'Create an account to continue.',
                ),
                AppSpacings.xLarge(),
                TextFormField(decoration: InputDecoration(hintText: 'Email')),
                AppSpacings.medium(),
                PasswordField(text: 'Password'),
                AppSpacings.medium(),
                PasswordField(text: 'Confirm password'),
                AppSpacings.xLarge(),
                BasicButton(onPressed: () {}, text: 'Create Account'),
                AppSpacings.medium(),
                LoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
