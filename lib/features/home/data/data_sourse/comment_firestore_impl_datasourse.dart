import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/data_sourse/comment_firestore_datasourse.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/models/comment_firestoremodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'comment_firestore_impl_datasourse.g.dart';

class CommentFirestoreDataSourseImpl implements CommentFirestoreDataSourse {
  final commentRef = FirebaseFirestore.instance
      .collection("comments")
      .withConverter(
          fromFirestore: CommentStoreModel.fromFirestore,
          toFirestore: (CommentStoreModel commentModel, options) =>
              commentModel.toFirestore());
  @override
  Future<void> addComment(CommentStoreModel commentModel, String id) async {
    final commentDoc = commentRef.doc();
    await commentDoc.set(commentModel);
  }

  @override
  Future<void> deleletComment(String id) async {
    await commentRef.doc(id).delete();
  }

  @override
  Stream<QuerySnapshot<CommentStoreModel>> getComment(String id) {
    return commentRef.where("id", isEqualTo: id).snapshots();
  }
}

@riverpod
CommentFirestoreDataSourse commentFirestoreDataSourse(
    CommentFirestoreDataSourseRef ref) {
  return CommentFirestoreDataSourseImpl();
}
