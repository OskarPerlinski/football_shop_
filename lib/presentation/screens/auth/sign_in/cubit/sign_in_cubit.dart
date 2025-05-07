import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:r_gol/domain/auth/auth_exception/auth_exception.dart';
import 'package:r_gol/domain/auth/repository/auth_repository.dart';
import 'package:r_gol/presentation/screens/auth/sign_in/cubit/sign_in_action.dart';
import 'package:r_gol/presentation/screens/auth/sign_in/cubit/sign_in_state.dart';

@injectable
class SignInCubit extends ActionCubit<SignInState, SignInAction> {
  SignInCubit(this._authRepository) : super(SignInState.initial());

  final AuthRepository _authRepository;

  Future<void> getSignIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(SignInInitial(errorMessage: 'Please fill in all fields.'));
      return;
    }
    dispatch(SignInAction.showLoading());
    try {
      await _authRepository.getSignIn(email, password);
      dispatch(SignInAction.success());
    } on AuthException catch (e) {
      emit(SignInInitial(errorMessage: e.message));
    } catch (e) {
      dispatch(SignInAction.showErrorMessage('Failed to login.'));
    } finally {
      dispatch(SignInAction.hideLoading());
    }
  }

  Future<void> loginWithGoogle() async {
    dispatch(const SignInAction.showLoading());

    try {
      await _authRepository.signInWithGoogle();
      dispatch(const SignInAction.success());
    } on AuthException catch (e) {
      dispatch(SignInAction.showErrorMessage(e.message));
    } catch (e) {
      dispatch(
        SignInAction.showErrorMessage("An error occurred during login."),
      );
    } finally {
      dispatch(const SignInAction.hideLoading());
    }
  }
}
