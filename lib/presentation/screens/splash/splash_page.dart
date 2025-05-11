import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:r_gol/presentation/router/routes/app_routes.dart';
import 'package:r_gol/presentation/screens/splash/cubit/splash_action.dart';
import 'package:r_gol/presentation/screens/splash/cubit/splash_cubit.dart';
import 'package:r_gol/presentation/theme/app_colors.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SplashCubit>();

    useEffect(() {
      cubit.checkIfLoggedIn();
      return null;
    }, []);

    useActionListener<SplashAction>(cubit, (action) {
      switch (action) {
        case SplashAuthenticated():
          context.go(AppRoutes.homePage);
        case SplashUnAuthenticated():
          context.go(AppRoutes.signIn);
      }
    });

    return Container(
      color: AppColors.white,
      child: Center(child: Image.asset('assets/rgol.png')),
    );
  }
}
