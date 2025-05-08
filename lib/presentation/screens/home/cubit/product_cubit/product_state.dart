import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:r_gol/domain/products/model/products_model.dart';

part 'product_state.freezed.dart';

@freezed
abstract class ProductState with _$ProductState{
  const factory ProductState.loading() = ProductLoading;
  const factory ProductState.loaded(List<ProductsModel> products) = ProductLoaded;
  const factory ProductState.error(String message) = ProductError;
}