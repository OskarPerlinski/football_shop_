import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_action.freezed.dart';

@freezed
abstract class ProductAction with _$ProductAction{
  const factory ProductAction.navigateToDetails(String productId) = ProductNavigateToDetails;
}