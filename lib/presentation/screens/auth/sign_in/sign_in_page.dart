import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:r_gol/presentation/assets/app_assets.dart';
import 'package:r_gol/presentation/screens/auth/widgets/create_account_button.dart';
import 'package:r_gol/presentation/screens/auth/widgets/forgot_password_button.dart';
import 'package:r_gol/presentation/screens/auth/widgets/header_auth.dart';
import 'package:r_gol/presentation/screens/auth/widgets/other_options_to_login.dart';
import 'package:r_gol/presentation/screens/auth/widgets/socials_button.dart';
import 'package:r_gol/presentation/theme/app_dimens.dart';
import 'package:r_gol/presentation/theme/app_spacings.dart';
import 'package:r_gol/presentation/widgets/button/basic_button.dart';
import 'package:r_gol/presentation/screens/auth/widgets/password_field.dart';

class SignInPage extends HookWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = useTextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.xl),
            child: Column(
              children: [
                HeaderAuth(
                  mainText: 'Sign In',
                  subtitleText: 'Welcome back! Please login.',
                ),
                AppSpacings.xLarge(),
                TextFormField(decoration: InputDecoration(hintText: 'Email')),
                AppSpacings.medium(),
                PasswordField(text: 'Password', controller: passwordController),
                AppSpacings.xLarge(),
                BasicButton(onPressed: () {}, text: 'Login to Account'),
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
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
