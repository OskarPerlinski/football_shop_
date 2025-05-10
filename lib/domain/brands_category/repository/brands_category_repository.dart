import 'package:r_gol/domain/brands_category/models/brands_category_models.dart';

abstract class BrandsCategoryRepository {
  Future<List<BrandsCategoryModels>> getBrandsCategory();
}
