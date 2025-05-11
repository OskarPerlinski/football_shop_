import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_action.freezed.dart';

@freezed
class SplashAction with _$SplashAction{
  const factory SplashAction.authenticated() = SplashAuthenticated;
  const factory SplashAction.unAuthenticated() = SplashUnAuthenticated;
}