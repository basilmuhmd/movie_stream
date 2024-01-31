import 'package:movieapp_cleanarchitrcture/core/exception/movie_exception/movie_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/repositery/movie_repositery.dart';

class UpcomingUsecases {
  final MovieRepositery repositery;

  UpcomingUsecases({required this.repositery});

  Future<List<MovieEntity>> call() async {
    try {
      return await repositery.getUpcoming();
    } catch (e) {
      throw MovieException("somthing went wrong");
    }
  }
}
