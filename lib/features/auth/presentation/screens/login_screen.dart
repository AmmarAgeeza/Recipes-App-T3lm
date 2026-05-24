import '../../../../core/constants/app_import.dart';
import '../components/hero_section.dart';
import '../components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [HeroSection(), LoginForm()]),
      ),
    );
  }
}
