import '../../core/enum/user_role.dart';

class EditProfileArgs {
  const EditProfileArgs({
    required this.role,
    required this.initialName,
    required this.initialPhone,
    required this.initialEmail,
    this.initialFirstName,
    this.initialLastName,
    this.initialNickname,
    this.initialEmiratesId,
  });

  final UserRole role;

  final String initialName;
  final String? initialPhone;
  final String initialEmail;

  // Resident-specific details
  final String? initialFirstName;
  final String? initialLastName;
  final String? initialNickname;
  final String? initialEmiratesId;
}
