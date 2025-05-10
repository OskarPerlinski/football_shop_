import 'package:freezed_annotation/freezed_annotation.dart';

part 'brands_category_models.freezed.dart';

@freezed
abstract class BrandsCategoryModels with _$BrandsCategoryModels{
  const factory BrandsCategoryModels({
    required String image,
    required String name,
    required String brandId,
  }) = _BrandsCategoryModels;
}