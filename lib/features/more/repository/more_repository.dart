import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_app/model/article_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moreRepositoryProvider=Provider((ref) => MoreRepository(auth: FirebaseAuth.instance, firebaseFirestore: FirebaseFirestore.instance));

class MoreRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firebaseFirestore;

  MoreRepository({required this.firebaseFirestore, required this.auth});


  Future<void> signOut() async {
  await auth.signOut();
  }

  Future<void> writeArticle(ArticleModel model) async {

    await firebaseFirestore
    .collection("articles")
    .doc(model.uid)
    .set(model.toMap());
    await addSubCollection(
      "users", auth.currentUser!.uid, "articles", model.uid, model.toMap());

  }

  Future<void> addSubCollection(
    String collectionName, 
    String docId, 
    String SubCollectionName, 
    subCollectionDocId, 
    Map<String,dynamic> data) async {
    await firebaseFirestore
    .collection(collectionName)
    .doc(docId)
    .collection(SubCollectionName)
    .doc(subCollectionDocId)
    .set(data);
  }

}