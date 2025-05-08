import 'package:injectable/injectable.dart';
import 'package:r_gol/data/products/dto/products_model_dto.dart';
import 'package:r_gol/domain/products/model/products_model.dart';

@injectable
class ProductsMapper {
  ProductsModelDto toDto(ProductsModel products) {
    return ProductsModelDto(
      name: products.name,
      league: products.league,
      productId: products.productId,
      season: products.season,
      price: products.price,
      size: products.size,
      createdAt: products.createdAt,
      images: products.imgaes,
      brandId: products.brandId,
      totalSold: products.totalSold,
    );
  }

  ProductsModel toDomain(ProductsModelDto dto) {
    return ProductsModel(
      name: dto.name,
      league: dto.league,
      productId: dto.productId,
      season: dto.season,
      price: dto.price,
      size: dto.size,
      createdAt: dto.createdAt,
      imgaes: dto.images,
      brandId: dto.brandId,
      totalSold: dto.totalSold,
    );
  }
}
