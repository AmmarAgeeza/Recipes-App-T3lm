import '../../../../core/constants/app_import.dart';
import '../cubits/login_cubit.dart';
import '../components/hero_section.dart';
import '../components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: const Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
