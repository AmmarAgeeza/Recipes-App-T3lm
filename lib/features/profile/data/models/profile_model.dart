import '../../../../core/constants/app_import.dart';

class ProfileModel extends Equatable {
  final String firstName;
  final String lastName;
  final String gender;
  final String username;
  final String email;
  final String avatarUrl;

  const ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.username,
    required this.email,
    required this.avatarUrl,
  });

  ProfileModel copyWith({
    String? firstName,
    String? lastName,
    String? gender,
    String? username,
    String? email,
    String? avatarUrl,
  }) {
    return ProfileModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      username: username ?? this.username,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  static ProfileModel get dummyData => const ProfileModel(
        firstName: 'Emily',
        lastName: 'Johnson',
        gender: 'Female',
        username: '@emilys',
        email: 'emily.johnson@x.dummyjson.com',
        avatarUrl: 'https://www.figma.com/api/mcp/asset/96b238b1-ee77-4068-aab9-6e77729881fa',
      );

  @override
  List<Object?> get props => [firstName, lastName, gender, username, email, avatarUrl];
}
