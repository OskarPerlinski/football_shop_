import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:r_gol/domain/league_category/models/league_category_models.dart';

part 'league_category_state.freezed.dart';

@freezed
abstract class LeagueCategoryState with _$LeagueCategoryState{
  const factory LeagueCategoryState.loading() = LeagueCategoryLoading;
  const factory LeagueCategoryState.loaded(List<LeagueCategoryModels> leagueCategory) = LeagueCategoryLoaded;
  const factory LeagueCategoryState.error(String message) = LeagueCategoryError;
}