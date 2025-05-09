import 'package:r_gol/domain/products/model/products_model.dart';

abstract class ProductsRepository {
  Future<List<ProductsModel>> getNewProducts();
  Future<List<ProductsModel>> getTopSellings();
}