import 'package:freezed_annotation/freezed_annotation.dart';

part 'brands_category_models_dto.freezed.dart';
part 'brands_category_models_dto.g.dart';

@freezed
abstract class BrandsCategoryModelsDto with _$BrandsCategoryModelsDto {
  const factory BrandsCategoryModelsDto({
    required String image,
    required String brandId,
    required String name,
  }) = _BrandsCategoryModelDto;

  factory BrandsCategoryModelsDto.fromJson(Map<String, dynamic> json) => 
      _$BrandsCategoryModelsDtoFromJson(json);

}