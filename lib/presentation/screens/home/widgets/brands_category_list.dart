import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:r_gol/presentation/assets/image_display_helper.dart';
import 'package:r_gol/presentation/screens/home/cubit/brands_category_cubit/brands_category_action.dart';
import 'package:r_gol/presentation/screens/home/cubit/brands_category_cubit/brands_category_cubit.dart';
import 'package:r_gol/presentation/screens/home/cubit/brands_category_cubit/brands_category_state.dart';
import 'package:r_gol/presentation/theme/app_dimens.dart';
import 'package:r_gol/presentation/theme/app_spacings.dart';
import 'package:r_gol/presentation/theme/app_typography.dart';

class BrandCategoryList extends HookWidget {
  const BrandCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<BrandsCategoryCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener(cubit, (action) {
      if (state is BrandsCategoryNavigateToDetailsBrands) {
        // final brandId = action.brandId,
        // context.go('/categoryDetail/$brandId');
      }
    });

    useEffect(() {
      cubit.getBrandsCategory();
      return null;
    }, []);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.m),
      child: switch (state) {
        BrandsCategoryLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
        BrandsCategoryError(:final message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message),
              AppSpacings.medium(),
              TextButton(
                onPressed: () => cubit.getBrandsCategory(),
                child: const Text('Failed to load. Try again!'),
              ),
            ],
          ),
        ),
        BrandsCategoryLoaded(:final brandsCategory) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Brands', style: AppTypography.h2),
            AppSpacings.medium(),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: brandsCategory.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 1,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(
                            ImageDisplayHelper.generateBrandsCategoryImageURL(
                              brandsCategory[index].image,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
