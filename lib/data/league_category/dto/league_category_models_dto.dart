import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_category_models_dto.freezed.dart';
part 'league_category_models_dto.g.dart';

@freezed
abstract class LeagueCategoryModelsDto with _$LeagueCategoryModelsDto {
  const factory LeagueCategoryModelsDto({
    required String name,
    required String leagueId,
    required String image,
  }) = _LeagueCategoryModelsDto;

  factory LeagueCategoryModelsDto.fromJson(Map<String, dynamic> json) =>
      _$LeagueCategoryModelsDtoFromJson(json);
}
