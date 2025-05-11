import 'package:injectable/injectable.dart';
import 'package:r_gol/data/user/datasource/user_data_source.dart';
import 'package:r_gol/domain/user/repository/user_repository.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userDataSource);

  final UserDataSource _userDataSource;

  @override
  Future<bool> checkIfUserExists(String uid) async {
    return _userDataSource.checkIfUserExists(uid);
  }

  @override
  Future<void> createUser(String uid, String email) async {
    return _userDataSource.createUser(uid, email);
  }
  
  @override
  bool get isLoggedIn => _userDataSource.isLoggedIn;
}
