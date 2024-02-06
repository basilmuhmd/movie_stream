import 'package:movieapp_cleanarchitrcture/features/home/data/data_sourse/comment_firestore_datasourse.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/data_sourse/comment_firestore_impl_datasourse.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/models/comment_firestoremodel.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/comment_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/repositery/comment_repositery.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'comment_repositery_impl.g.dart';

class CommentRepositeryImpl implements CommentRepositery {
  final CommentFirestoreDataSourse dataSourse;

  CommentRepositeryImpl({required this.dataSourse});
  @override
  Future<void> addComment(CommentEntity commentEntity, String id) async {
    final value =
        CommentStoreModel(id: commentEntity.id, text: commentEntity.text);
    await dataSourse.addComment(value, id);
  }

  @override
  Future<void> deleletComment(String id) async {
    await dataSourse.deleletComment(id);
  }

  @override
  Stream<List<CommentEntity>> getComment(String id) async* {
    final data = dataSourse.getComment(id);
    await for (var snapshot in data) {
      final docs = snapshot.docs;
      yield [
        for (var model in docs)
          CommentEntity(
              movieId: model.data().id, text: model.data().text, id: model.id)
      ];
    }
  }
}

@riverpod
CommentRepositery commentRepositery(CommentRepositeryRef ref) {
  return CommentRepositeryImpl(
      dataSourse: ref.watch(commentFirestoreDataSourseProvider));
}
