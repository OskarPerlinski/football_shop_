import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_model_dto.freezed.dart';
part 'products_model_dto.g.dart';

@freezed
abstract class ProductsModelDto with _$ProductsModelDto {
  const factory ProductsModelDto({
    required String name,
    required String league,
    required String productId,
    required String season,
    required int price,
    required List<String> size,
    required List<String> images,
    @TimestampConverter() required DateTime createdAt,
    required int totalSold,
    required String brandId,
  }) = _ProductsModelDto;

factory ProductsModelDto.fromJson(Map<String, dynamic> json) => 
      _$ProductsModelDtoFromJson(json);

}


class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}