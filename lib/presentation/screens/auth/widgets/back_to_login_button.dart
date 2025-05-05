import 'package:flutter/material.dart';
import 'package:r_gol/presentation/router/app_router.dart';

class BackToLoginButton extends StatelessWidget {
  const BackToLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => SignInRoute().go(context),
      child: Text('Back to Login Page'),
    );
  }
}
