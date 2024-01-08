import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_app/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepositoryProvider = Provider((ref) => 
ProfileRepository(
auth: FirebaseAuth.instance, 
firebaseFirestore: FirebaseFirestore.instance));


class ProfileRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth auth;

  ProfileRepository({
    required this.firebaseFirestore, 
    required this.auth});

  Future<UserModel> getUser() async {
     return firebaseFirestore
     .collection('users')
     .doc(auth.currentUser!.uid)
     .get()
     .then((value) {
      return UserModel.fromMap(value.data()!);
     });
  }
}