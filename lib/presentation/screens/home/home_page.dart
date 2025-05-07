import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:r_gol/presentation/screens/home/widgets/app_banner.dart';
import 'package:r_gol/presentation/widgets/appbar/basic_appbar.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AppBanner(),
            ],
          ),
        ),
      ),
    );
  }
}