import 'package:injectable/injectable.dart';
import 'package:r_gol/data/league_category/dto/league_category_models_dto.dart';
import 'package:r_gol/domain/league_category/models/league_category_models.dart';

@injectable
class LeagueCategoryMapper {
  LeagueCategoryModelsDto toDto(LeagueCategoryModels league) {
    return LeagueCategoryModelsDto(
      name: league.name,
      leagueId: league.leagueId,
      image: league.image,
    );
  }

  LeagueCategoryModels toDomain(LeagueCategoryModelsDto dto) {
    return LeagueCategoryModels(
      image: dto.image,
      name: dto.name,
      leagueId: dto.leagueId,
    );
  }
}
