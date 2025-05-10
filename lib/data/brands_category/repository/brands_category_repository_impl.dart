import 'package:injectable/injectable.dart';
import 'package:r_gol/data/brands_category/datasource/brands_category_data_source.dart';
import 'package:r_gol/data/brands_category/mapper/brands_category_mapper.dart';
import 'package:r_gol/domain/brands_category/models/brands_category_models.dart';
import 'package:r_gol/domain/brands_category/repository/brands_category_repository.dart';

@Singleton(as: BrandsCategoryRepository)
class BrandsCategoryRepositoryImpl implements BrandsCategoryRepository {
  BrandsCategoryRepositoryImpl(
    this._brandsCategoryDataSource,
    this._brandsCategoryMapper,
  );

  final BrandsCategoryDataSource _brandsCategoryDataSource;
  final BrandsCategoryMapper _brandsCategoryMapper;

  @override
  Future<List<BrandsCategoryModels>> getBrandsCategory() async {
    try {
      final dtoList = await _brandsCategoryDataSource.getBrandsCategory();
      return dtoList.map((dto) => _brandsCategoryMapper.toDomain(dto)).toList();
    } catch (e) {
      throw Exception('Failed to load $e');
    }
  }
}
