import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_model.freezed.dart';

@freezed
abstract class ProductsModel with _$ProductsModel {
  const factory ProductsModel({
    required String name,
    required String league,
    required String productId,
    required String season,
    required int price,
    required List<String> size,
    required DateTime createdAt,
    required List<String> imgaes,
    required int totalSold,
    required String brandId,
  }) = _ProductsModel;
}
