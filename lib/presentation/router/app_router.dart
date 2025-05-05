import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:r_gol/presentation/router/routes/app_routes.dart';
import 'package:r_gol/presentation/screens/auth/sign_in/sign_in_page.dart';
import 'package:r_gol/presentation/screens/auth/sign_up/sign_up_page.dart';

part 'app_router.g.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.signUp,
    routes: $appRoutes,
  );
}

@TypedGoRoute<SignUpRoute>(path: AppRoutes.signUp)
class SignUpRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpPage();
  }
}

@TypedGoRoute<SignInRoute>(path: AppRoutes.signIn)
class SignInRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInPage();
  }
}
