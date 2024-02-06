import 'package:movieapp_cleanarchitrcture/core/exception/base_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/comment_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/repositery/comment_repositery.dart';

class CommentUsecases {
  final CommentRepositery repositery;

  CommentUsecases({required this.repositery});
  Future<void> call(CommentEntity model, String id) async {
    try {
      return await repositery.addComment(model, id);
    } catch (e) {
      throw BaseException("error");
    }
  }
}
