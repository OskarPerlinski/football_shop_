import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:r_gol/domain/products/model/product_section_type.dart';
import 'package:r_gol/presentation/screens/home/widgets/app_banner.dart';
import 'package:r_gol/presentation/theme/app_spacings.dart';
import 'package:r_gol/presentation/widgets/appbar/basic_appbar.dart';
import 'package:r_gol/presentation/widgets/products_list/products_List.dart';

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
              AppSpacings.xLarge(),
              ProductsList(text: 'Recently Added', type: ProductSectionType.newProducts)
            ],
          ),
        ),
      ),
    );
  }
}