import '../../../../core/constants/app_import.dart';
import '../cubits/home_cubit.dart';
import '../cubits/home_state.dart';
import 'loading_dot.dart';
import 'recipes_list.dart';
import 'search_bar.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SearchBarWithIcon(),
            ),
            const SizedBox(height: 32),
            Expanded(child: RecipesList(state: state)),
            if (state.recipesStatus == RequestState.loading)
              const LoadingIndicator(),
          ],
        );
      },
    );
  }
}
