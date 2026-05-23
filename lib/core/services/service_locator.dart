import 'package:get_it/get_it.dart';
import '../constants/app_import.dart';
import '../../features/home/data/repositories/home_repository.dart';
import '../../features/home/presentation/cubits/home_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  ServiceLocator._();

  static void setup() {
    // Register repositories
    sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());

    // Register cubits
    sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
  }
}
