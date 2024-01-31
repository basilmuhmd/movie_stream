import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';

abstract class MovieRepositery {
  Future<List<MovieEntity>> getMovies();
  Future<List<MovieEntity>> getPopular();
  Future<List<MovieEntity>> getUpcoming();
  Future<List<MovieEntity>> getToprated();
}
