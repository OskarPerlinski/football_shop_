import 'package:injectable/injectable.dart';
import 'package:r_gol/data/league_category/datasource/league_category_data_source.dart';
import 'package:r_gol/data/league_category/mapper/league_category_mapper.dart';
import 'package:r_gol/domain/league_category/models/league_category_models.dart';
import 'package:r_gol/domain/league_category/repository/league_category_repository.dart';

@Singleton(as: LeagueCategoryRepository)
class LeagueCategoryRepositoryImpl implements LeagueCategoryRepository {
  LeagueCategoryRepositoryImpl(
    this._leagueCategoryDataSource,
    this._leagueCategoryMapper,
  );

  final LeagueCategoryDataSource _leagueCategoryDataSource;
  final LeagueCategoryMapper _leagueCategoryMapper;

  @override
  Future<List<LeagueCategoryModels>> getLeagueCategory() async {
    try {
      final dtoList = await _leagueCategoryDataSource.getLeagueCategory();
      return dtoList.map((dto) => _leagueCategoryMapper.toDomain(dto)).toList();
    } catch (e) {
      throw Exception('Failed to load $e');
    }
  }
}
