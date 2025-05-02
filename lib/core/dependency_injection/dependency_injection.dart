import 'package:injectable/injectable.dart';
import 'package:r_gol/core/dependency_injection/dependency_injection.config.dart';
import 'package:r_gol/core/get_it/get_it.dart';

@injectableInit
Future<void> setupDependencies() async => getIt.init();