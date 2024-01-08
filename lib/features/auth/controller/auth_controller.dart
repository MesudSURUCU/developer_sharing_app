import 'package:flutter_auth_app/features/auth/repository/auth_repository.dart';
import 'package:flutter_auth_app/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
  ),
);

class AuthController {

final AuthRepository authRepository;

  AuthController({required this.authRepository});

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authRepository.signInWithEmailAndPassword(
      email: email, 
       password: password
       );
  }

  Future<void> signUpWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  await authRepository.signUpWithEmailAndPassword(
    email: email, 
   password: password,
  );
}

Future<void> signOut() async {
  await authRepository.signOut();
}



Future<void> storeUserInfoToFirebase (UserModel userModel) async{
return authRepository.storeUserInfoToFirebase(userModel);
}

}