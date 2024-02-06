import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'comment_firestoremodel.freezed.dart';
part 'comment_firestoremodel.g.dart';

@freezed
class CommentStoreModel with _$CommentStoreModel {
  const CommentStoreModel._();

  factory CommentStoreModel({
    required String id,
    required String text,
  }) = _CommentStoreModel;

  factory CommentStoreModel.fromJson(Map<String, dynamic> json) =>
      _$CommentStoreModelFromJson(json);
  factory CommentStoreModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return CommentStoreModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
