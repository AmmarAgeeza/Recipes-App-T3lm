import '../../../../core/constants/app_import.dart';
import '../components/home_app_bar.dart';
import '../components/home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: const HomeAppBar(),
      body: const HomeContent(),
    );
  }
}
