import '../constants/app_import.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/home/presentation/cubits/home_cubit.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<HomeCubit>()..loadRecipes(),
            child: const HomeScreen(),
          ),
        );
      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(AppStrings.signUpScreenComingSoon),
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(AppStrings.routeNotFound),
            ),
          ),
        );
    }
  }
}
