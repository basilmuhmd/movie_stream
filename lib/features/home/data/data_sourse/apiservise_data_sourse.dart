import 'package:movieapp_cleanarchitrcture/features/home/data/models/movie_api_model.dart';

abstract class ApiServiceDataSourse {
  Future<MovieModel?> getMovies();
  Future<MovieModel?> getPopular();
  Future<MovieModel?> getUpcoming();
  Future<MovieModel?> getToprated();
}
