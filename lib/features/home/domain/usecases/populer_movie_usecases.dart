import 'package:movieapp_cleanarchitrcture/core/exception/movie_exception/movie_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/repositery/movie_repositery.dart';

class PopulerUsecase {
  final MovieRepositery repositery;

  PopulerUsecase({required this.repositery});

  Future<List<MovieEntity>> call() async {
    try {
      return await repositery.getPopular();
    } catch (e) {
      throw MovieException("somthing went wrong");
    }
  }
}
