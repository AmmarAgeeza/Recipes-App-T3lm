import '../../../../core/constants/app_import.dart';
import '../cubits/home_cubit.dart';
import '../cubits/home_state.dart';
import '../components/recipe_card.dart';
import '../components/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Stack(
        children: [
          const _MainContent(),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: _HomeAppBar(),
          ),
        ],
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: const Color(0xCCF8F9FF),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 12,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0x1AB12C16),
                width: 2,
              ),
            ),
            child: ClipOval(
              child: Image.network(
                'https://www.figma.com/api/mcp/asset/b3a147e0-851f-4f47-a664-d5badbeea25e',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.inputBackground,
                    child: const Icon(
                      Icons.person,
                      color: AppColors.bodyText,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            AppStrings.appName,
            style: TextStyle(
              fontFamily: 'PublicSans',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              height: 24 / 16,
              color: Color(0xFFB12C16),
            ),
          ),
        ],
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(height: 96),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: const SearchBarWithIcon(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: _buildRecipesList(context, state),
            ),
            if (state.recipesStatus == RequestState.loading)
              SliverToBoxAdapter(
                child: _buildLoadingIndicator(),
              ),
          ],
        );
      },
    );
  }

  Widget _buildRecipesList(BuildContext context, HomeState state) {
    if (state.recipes.isEmpty && state.recipesStatus != RequestState.loading) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text(
            'No recipes found',
            style: AppTextStyles.body,
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index >= state.recipes.length) return null;

          final recipe = state.recipes[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: RecipeCard(
              recipe: recipe,
              onFavoriteToggle: () {
                context.read<HomeCubit>().toggleFavorite(recipe.id);
              },
            ),
          );
        },
        childCount: state.recipes.length,
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _LoadingDot(opacity: 0.3),
          SizedBox(width: 8),
          _LoadingDot(opacity: 0.6),
          SizedBox(width: 8),
          _LoadingDot(opacity: 1.0),
        ],
      ),
    );
  }
}

class _LoadingDot extends StatelessWidget {
  final double opacity;

  const _LoadingDot({required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: const Color(0xFFB12C16).withValues(alpha: opacity),
        shape: BoxShape.circle,
      ),
    );
  }
}
