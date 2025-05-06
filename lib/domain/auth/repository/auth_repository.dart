import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> getSignUpWithEmail(String email, String password);
}
