import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:r_gol/domain/league_category/repository/league_category_repository.dart';
import 'package:r_gol/presentation/screens/home/cubit/league_category_cubit/league_category_action.dart';
import 'package:r_gol/presentation/screens/home/cubit/league_category_cubit/league_category_state.dart';

@injectable
class LeagueCategoryCubit
    extends ActionCubit<LeagueCategoryState, LeagueCategoryAction> {
  LeagueCategoryCubit(this._leagueCategoryRepository)
    : super(LeagueCategoryState.loading());

  final LeagueCategoryRepository _leagueCategoryRepository;

  Future<void> getLeagueCategory() async {
    emit(LeagueCategoryState.loading());
    try {
      final leagueCategory =
          await _leagueCategoryRepository.getLeagueCategory();
      emit(LeagueCategoryState.loaded(leagueCategory));
    } catch (e) {
      emit(LeagueCategoryState.error('Failed to load'));
    }
  }
}
