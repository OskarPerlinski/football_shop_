import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:r_gol/domain/user/repository/user_repository.dart';
import 'package:r_gol/presentation/screens/splash/cubit/splash_action.dart';

@injectable
class SplashCubit extends ActionCubit<int, SplashAction> {
  SplashCubit(this.userRepository) : super(0);

  final UserRepository userRepository;

  void checkIfLoggedIn() async {
    await Future.delayed(const Duration(seconds: 3));
    final isAuthenticated = userRepository.isLoggedIn;
    if (isAuthenticated) {
      dispatch(const SplashAction.authenticated());
    } else {
      dispatch(const SplashAction.unAuthenticated());
    }
  }
}
