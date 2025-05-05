import 'package:flutter/material.dart';
import 'package:r_gol/presentation/theme/app_dimens.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.xxl,
      width: double.infinity,
      child: FilledButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
