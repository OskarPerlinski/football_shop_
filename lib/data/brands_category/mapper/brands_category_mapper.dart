import 'package:injectable/injectable.dart';
import 'package:r_gol/data/brands_category/dto/brands_category_models_dto.dart';
import 'package:r_gol/domain/brands_category/models/brands_category_models.dart';

@injectable
class BrandsCategoryMapper {
  BrandsCategoryModelsDto toDto(BrandsCategoryModels brands) {
    return BrandsCategoryModelsDto(
      image: brands.image,
      brandId: brands.brandId,
      name: brands.name,
    );
  }

  BrandsCategoryModels toDomain(BrandsCategoryModelsDto dto) {
    return BrandsCategoryModels(
      image: dto.image,
      name: dto.name,
      brandId: dto.brandId,
    );
  }
}
