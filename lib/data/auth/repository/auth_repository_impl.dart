import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:r_gol/data/auth/datasource/email_data_source.dart';
import 'package:r_gol/data/user/datasource/user_data_source.dart';
import 'package:r_gol/domain/auth/repository/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._emailDataSource, this._userDataSource);

  final EmailDataSource _emailDataSource;
  final UserDataSource _userDataSource;

  @override
  Future<UserCredential> getSignUpWithEmail(
    String email,
    String password,
  ) async {
    final userCredential = await _emailDataSource.getSignUpWithEmail(
      email,
      password,
    );
    final user = userCredential.user;

    if (user == null) {
      throw Exception("Email sign-up failed: user is null.");
    }
    final uid = user.uid;
    final exists = await _userDataSource.checkIfUserExists(uid);
    if (!exists) {
      await _userDataSource.createUser(uid, email);
    }

    return userCredential;
  }
}
