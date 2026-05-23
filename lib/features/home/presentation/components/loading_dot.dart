import '../../../../core/constants/app_import.dart';

class LoadingDot extends StatelessWidget {
  final double opacity;

  const LoadingDot({super.key, required this.opacity});

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

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingDot(opacity: 0.3),
          SizedBox(width: 8),
          LoadingDot(opacity: 0.6),
          SizedBox(width: 8),
          LoadingDot(opacity: 1.0),
        ],
      ),
    );
  }
}
