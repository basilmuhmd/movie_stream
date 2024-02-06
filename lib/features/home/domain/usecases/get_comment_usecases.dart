import 'package:movieapp_cleanarchitrcture/core/exception/base_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/comment_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/repositery/comment_repositery.dart';

class GetCommentUsescases {
  final CommentRepositery repositery;

  GetCommentUsescases({required this.repositery});
  Stream<List<CommentEntity>> call(String id) {
    try {
      return repositery.getComment(id);
    } catch (e) {
      throw BaseException("Error");
    }
  }
}
