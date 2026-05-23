import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  ServiceLocator._();

  static void setup() {
    // Register repositories
    // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

    // Register cubits
    // sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
  }
}
