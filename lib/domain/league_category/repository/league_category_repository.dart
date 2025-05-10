import 'package:r_gol/domain/league_category/models/league_category_models.dart';

abstract class LeagueCategoryRepository {
  Future<List<LeagueCategoryModels>> getLeagueCategory();
}
