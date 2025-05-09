import 'package:injectable/injectable.dart';
import 'package:r_gol/data/products/datasource/products_data_source.dart';
import 'package:r_gol/data/products/mapper/products_mapper.dart';
import 'package:r_gol/domain/products/model/products_model.dart';
import 'package:r_gol/domain/products/repository/products_repository.dart';

@Singleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  ProductsRepositoryImpl(this._productsDataSource, this._productsMapper);

  final ProductsDataSource _productsDataSource;
  final ProductsMapper _productsMapper;

  @override
  Future<List<ProductsModel>> getNewProducts() async {
    try {
      final dtoList = await _productsDataSource.getNewProducts();
      return dtoList.map((dto) => _productsMapper.toDomain(dto)).toList();
    } catch (e) {
      throw Exception('Failed to fetch new products: $e');
    }
  }

  @override
  Future<List<ProductsModel>> getTopSellings() async {
    try {
      final dtoList = await _productsDataSource.getTopSellings();
      return dtoList.map((dto) => _productsMapper.toDomain(dto)).toList();
    } catch (e) {
      throw Exception('Failed to load top sellings products: $e');
    }
  }
}
