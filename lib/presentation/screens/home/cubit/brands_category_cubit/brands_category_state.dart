import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:r_gol/domain/brands_category/models/brands_category_models.dart';

part 'brands_category_state.freezed.dart';

@freezed
abstract class BrandsCategoryState with _$BrandsCategoryState {
  const factory BrandsCategoryState.loading() = BrandsCategoryLoading;
  const factory BrandsCategoryState.loaded(List<BrandsCategoryModels> brandsCategory) =
      BrandsCategoryLoaded;
  const factory BrandsCategoryState.error(String message) = BrandsCategoryError;
}
