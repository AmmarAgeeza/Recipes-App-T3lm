import '../../../../core/constants/app_import.dart';
import '../components/profile_app_bar.dart';
import '../components/profile_avatar.dart';
import '../components/profile_info_card.dart';
import '../components/profile_info_row.dart';
import '../components/logout_button.dart';
import '../../data/models/profile_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = ProfileModel.dummyData;

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: const ProfileAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: ProfileAvatar(avatarUrl: profile.avatarUrl),
              ),
              const SizedBox(height: 50),
              ProfileInfoCard(
                title: AppStrings.personalInformation,
                children: [
                  ProfileInfoRow(
                    label: AppStrings.firstName,
                    value: profile.firstName,
                  ),
                  ProfileInfoRow(
                    label: AppStrings.lastName,
                    value: profile.lastName,
                  ),
                  ProfileInfoRow(
                    label: AppStrings.gender,
                    value: profile.gender,
                    showBorder: false,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ProfileInfoCard(
                title: AppStrings.accountDetails,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileInfoRow(
                        label: AppStrings.username,
                        value: profile.username,
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          profile.email,
                          style: const TextStyle(
                            fontFamily: 'PublicSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 24 / 16,
                            color: AppColors.headingText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const LogoutButton(
                onTap: null,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
