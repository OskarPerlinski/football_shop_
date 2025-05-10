import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_category_models.freezed.dart';

@freezed
abstract class LeagueCategoryModels with _$LeagueCategoryModels {
  const factory LeagueCategoryModels({
    required String image,
    required String name,
    required String leagueId,
  }) = _LeagueCategoryModels;
}
