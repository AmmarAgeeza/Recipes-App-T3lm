import '../../../../core/constants/app_import.dart';

class ProfileInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool showBorder;

  const ProfileInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: showBorder
            ? const Border(
                bottom: BorderSide(
                  color: Color(0x4DE2BFB8),
                  width: 1,
                ),
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'PublicSans',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 24 / 16,
              color: AppColors.bodyText,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'PublicSans',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 24 / 16,
              color: AppColors.headingText,
            ),
          ),
        ],
      ),
    );
  }
}
