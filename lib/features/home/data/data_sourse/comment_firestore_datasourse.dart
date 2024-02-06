import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/models/comment_firestoremodel.dart';

abstract class CommentFirestoreDataSourse {
  Future<void> addComment(CommentStoreModel commentModel, String id);

  Future<void> deleletComment(String id);

  Stream<QuerySnapshot<CommentStoreModel>> getComment(String id);
}
