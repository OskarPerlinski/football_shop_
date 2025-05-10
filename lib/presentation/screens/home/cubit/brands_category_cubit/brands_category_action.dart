import 'package:freezed_annotation/freezed_annotation.dart';

part 'brands_category_action.freezed.dart';

@freezed
abstract class BrandsCategoryAction with _$BrandsCategoryAction {
  const factory BrandsCategoryAction.navigateToDetailsBrands() =
      BrandsCategoryNavigateToDetailsBrands;
}
