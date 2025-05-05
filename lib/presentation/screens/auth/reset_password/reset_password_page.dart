import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:r_gol/presentation/screens/auth/widgets/back_to_login_button.dart';
import 'package:r_gol/presentation/screens/auth/widgets/header_auth.dart';
import 'package:r_gol/presentation/theme/app_dimens.dart';
import 'package:r_gol/presentation/theme/app_spacings.dart';
import 'package:r_gol/presentation/widgets/button/basic_button.dart';

class ResetPasswordPage extends HookWidget {
  const ResetPasswordPage({super.key});

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
                  mainText: 'Reset Password',
                  subtitleText: "We'll send you a link to reset your password.",
                ),
                AppSpacings.xLarge(),
                TextFormField(decoration: InputDecoration(hintText: 'Email')),
                AppSpacings.xLarge(),
                BasicButton(onPressed: () {}, text: 'Send Email'),
                AppSpacings.large(),
                BackToLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
