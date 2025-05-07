import 'package:flutter/material.dart';
import 'package:r_gol/presentation/theme/app_colors.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppbar({super.key, this.height, this.showBackButton = false});

  final double? height;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading:
          showBackButton
              ? IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.black),
                onPressed: () => Navigator.of(context).maybePop(),
              )
              : null,
      title: Image.asset('assets/rgol.png', height: 100, fit: BoxFit.contain),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}
