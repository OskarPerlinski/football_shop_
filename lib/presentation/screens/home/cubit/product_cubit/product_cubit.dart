import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:r_gol/domain/products/model/product_section_type.dart';
import 'package:r_gol/domain/products/repository/products_repository.dart';
import 'package:r_gol/presentation/screens/home/cubit/product_cubit/product_action.dart';
import 'package:r_gol/presentation/screens/home/cubit/product_cubit/product_state.dart';

@injectable
class ProductCubit extends ActionCubit<ProductState, ProductAction> {
  ProductCubit(this._productsRepository) : super(ProductState.loading());

  final ProductsRepository _productsRepository;

  Future<void> loadProducts(ProductSectionType type) async {
    emit(ProductState.loading());
    try {
      final products = switch (type) {
        ProductSectionType.newProducts =>
          await _productsRepository.getNewProducts(),
      };
      emit(ProductState.loaded(products));
    } catch (e) {
      emit(ProductState.error('Failed to load. Try again!'));
    }
  }

  void navigateToDetails(String productId) {
    dispatch(ProductAction.navigateToDetails(productId));
  }
}
