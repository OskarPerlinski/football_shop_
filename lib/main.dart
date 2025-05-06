import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:r_gol/core/dependency_injection/dependency_injection.dart';
import 'package:r_gol/core/get_it/get_it.dart';
import 'package:r_gol/firebase_options.dart';
import 'package:r_gol/presentation/router/app_router.dart';
import 'package:r_gol/presentation/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupDependencies();
  runApp(HookedBlocConfigProvider(injector: () => getIt.get, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(),
    );
  }
}
