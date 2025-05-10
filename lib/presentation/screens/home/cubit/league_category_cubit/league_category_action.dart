import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_category_action.freezed.dart';

@freezed
abstract class LeagueCategoryAction with _$LeagueCategoryAction{
  const factory LeagueCategoryAction.navigateToCategoryDetial(String leagueId) = LeagueCategoryNavigateToCategoryDetail;
}