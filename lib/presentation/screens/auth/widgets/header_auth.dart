import 'package:flutter/material.dart';
import 'package:r_gol/presentation/theme/app_colors.dart';
import 'package:r_gol/presentation/theme/app_dimens.dart';
import 'package:r_gol/presentation/theme/app_spacings.dart';
import 'package:r_gol/presentation/theme/app_typography.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    super.key,
    required this.mainText,
    required this.subtitleText,
  });

  final String mainText;
  final String subtitleText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimens.m),
      child: Center(
        child: Column(
          children: [
            Text(mainText, style: AppTypography.h1),
            AppSpacings.medium(),
            Text(
              subtitleText,
              style: AppTypography.h4.copyWith(color: AppColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
