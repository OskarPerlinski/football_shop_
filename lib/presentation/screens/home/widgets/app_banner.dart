import 'package:flutter/widgets.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/banner.png', height: 150, fit: BoxFit.cover);
  }
}
