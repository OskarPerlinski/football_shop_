import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:r_gol/domain/brands_category/repository/brands_category_repository.dart';
import 'package:r_gol/presentation/screens/home/cubit/brands_category_cubit/brands_category_action.dart';
import 'package:r_gol/presentation/screens/home/cubit/brands_category_cubit/brands_category_state.dart';

@injectable
class BrandsCategoryCubit extends ActionCubit<BrandsCategoryState, BrandsCategoryAction> {
  BrandsCategoryCubit(this._brandsCategoryRepository) : super(BrandsCategoryState.loading());

  final BrandsCategoryRepository _brandsCategoryRepository;

  Future<void> getBrandsCategory() async {
    emit(BrandsCategoryState.loading());
    try{
      final brandsCategory = await _brandsCategoryRepository.getBrandsCategory();
      emit(BrandsCategoryState.loaded(brandsCategory));
    } catch(e) {
      emit(BrandsCategoryState.error('Failed to load.'));
    }
  }
}