import 'package:flutter/material.dart';
import 'package:r_gol/presentation/router/app_router.dart';
import 'package:r_gol/presentation/theme/app_colors.dart';
import 'package:r_gol/presentation/theme/app_typography.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => ForgotPasswordRoute().go(context),
        child: Text(
          'Forgot password?',
          style: AppTypography.h5.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.error,
          ),
        ),
      ),
    );
  }
}
