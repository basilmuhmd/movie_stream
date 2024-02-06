import 'package:movieapp_cleanarchitrcture/core/exception/base_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/repositery/comment_repositery.dart';

class DeleteCommentUsecases {
  final CommentRepositery repositery;

  DeleteCommentUsecases({required this.repositery});
  Future<void> call(String id) async {
    try {
      await repositery.deleletComment(id);
    } catch (e) {
      BaseException("error");
    }
  }
}
