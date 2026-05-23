import '../../../../core/constants/app_import.dart';
import 'recipes_list.dart';
import 'search_bar.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SearchBarWithIcon(),
        ),
        const SizedBox(height: 32),
        Expanded(child: RecipesList()),
      ],
    );
  }
}
