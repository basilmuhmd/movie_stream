import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/comment_entity.dart';

abstract class CommentRepositery {
  Future<void> addComment(CommentEntity commentEntity, String id);

  Future<void> deleletComment(String id);

  Stream<List<CommentEntity>> getComment(String id);
}
