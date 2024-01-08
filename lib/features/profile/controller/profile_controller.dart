import 'package:flutter_auth_app/features/profile/repository/profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/user_model.dart';

final ProfileControllerProvider = Provider((ref) => ProfileController(
  profileRepository: ref.read(profileRepositoryProvider),
  ),
 );

class ProfileController {
  final ProfileRepository profileRepository;

  ProfileController({
    required this.profileRepository
    });

    Future<UserModel> getUser() async {
      return await profileRepository.getUser();
    }
}