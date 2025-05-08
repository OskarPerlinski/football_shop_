import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:r_gol/domain/products/model/product_section_type.dart';
import 'package:r_gol/presentation/assets/image_display_helper.dart';
import 'package:r_gol/presentation/screens/home/cubit/product_cubit/product_action.dart';
import 'package:r_gol/presentation/screens/home/cubit/product_cubit/product_cubit.dart';
import 'package:r_gol/presentation/screens/home/cubit/product_cubit/product_state.dart';
import 'package:r_gol/presentation/theme/app_dimens.dart';
import 'package:r_gol/presentation/theme/app_spacings.dart';
import 'package:r_gol/presentation/theme/app_typography.dart';

class ProductsList extends HookWidget {
  const ProductsList({super.key, required this.text, required this.type});

  final String text;
  final ProductSectionType type;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<ProductCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener(cubit, (action) {
      if (state is ProductNavigateToDetails) {
        // final productId = action.productId,
        // context.go('/detail/$productId');
      }
    });

    useEffect(() {
      cubit.loadProducts(type);
      return null;
    }, [type]);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.m),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: AppTypography.h2),
          AppSpacings.medium(),
          switch (state) {
            ProductLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            ProductError(:final message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message),
                  AppSpacings.medium(),
                  TextButton(
                    onPressed: () => cubit.loadProducts(type),
                    child: const Text('Failed to load. Try again!'),
                  ),
                ],
              ),
            ),
            ProductLoaded(:final products) => SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDimens.s),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(
                              ImageDisplayHelper.generateProductImageURL(
                                products[index].imgaes[0],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppDimens.s),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].name,
                              style: AppTypography.h5.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            AppSpacings.small(),
                            Text("\$${products[index].price}"),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder:
                    (context, index) => SizedBox(width: AppDimens.m),
                itemCount: products.length,
              ),
            ),
            _ => const Center(child: CircularProgressIndicator()),
          },
        ],
      ),
    );
  }
}
