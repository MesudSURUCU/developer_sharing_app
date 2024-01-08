import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final CommonFSRepositoryProvider =
Provider((ref) => CommonFirebaseStorageRepository(
  firebaseStorage: FirebaseStorage.instance));

class CommonFirebaseStorageRepository {
  final FirebaseStorage firebaseStorage;

  CommonFirebaseStorageRepository({required this.firebaseStorage});

  Future<String> storeFileToFirebase(String ref, File file) async {
    final storageRef = firebaseStorage.ref(ref);
    final UploadTask = storageRef.putFile(file);
    final snapshot = await UploadTask.whenComplete(() => null);
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}