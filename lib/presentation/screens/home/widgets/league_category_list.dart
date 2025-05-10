import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:r_gol/presentation/assets/image_display_helper.dart';
import 'package:r_gol/presentation/screens/home/cubit/league_category_cubit/league_category_action.dart';
import 'package:r_gol/presentation/screens/home/cubit/league_category_cubit/league_category_cubit.dart';
import 'package:r_gol/presentation/screens/home/cubit/league_category_cubit/league_category_state.dart';
import 'package:r_gol/presentation/theme/app_dimens.dart';
import 'package:r_gol/presentation/theme/app_spacings.dart';
import 'package:r_gol/presentation/theme/app_typography.dart';

class LeagueCategoryList extends HookWidget {
  const LeagueCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<LeagueCategoryCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener(cubit, (action) {
      if (state is LeagueCategoryNavigateToCategoryDetail) {
        // final leagueId = action.productId,
        // context.go('/categoryDetail/$leagueId');
      }
    });

    useEffect(() {
      cubit.getLeagueCategory();
      return null;
    }, []);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.m),
      child: switch (state) {
        LeagueCategoryLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
        LeagueCategoryError(:final message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message),
              AppSpacings.medium(),
              TextButton(
                onPressed: () => cubit.getLeagueCategory(),
                child: const Text('Failed to load. Try again!'),
              ),
            ],
          ),
        ),
        LeagueCategoryLoaded(:final leagueCategory) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Club Collections', style: AppTypography.h2),
            AppSpacings.medium(),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: leagueCategory.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 250,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(
                            ImageDisplayHelper.generateLeagueCategoryImageURL(
                              leagueCategory[index].image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AppSpacings.medium(),
                    Text(
                      leagueCategory[index].name,
                      style: AppTypography.h4.copyWith(
                        fontWeight: FontWeight.w700,
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
