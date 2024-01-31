import 'package:movieapp_cleanarchitrcture/features/home/data/data_sourse/apiservice_model_impl.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/data_sourse/apiservise_data_sourse.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/repositery/movie_repositery.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_repositery_impl.g.dart';

class MovieRepositeryImpl implements MovieRepositery {
  final ApiServiceDataSourse dataSourse;

  MovieRepositeryImpl({required this.dataSourse});

  @override
  Future<List<MovieEntity>> getMovies() async {
    final data = await dataSourse.getMovies();

    late List<MovieEntity> results;
    if (data == null) {
      results = [];
    } else {
      results = [
        for (final result in data.results)
          MovieEntity(
            originalTitle: result.originalTitle,
            overview: result.overview,
            popularity: result.popularity,
            posterPath: result.posterPath,
            releaseDate: result.releaseDate,
            title: result.title,
            video: result.video,
            voteAverage: result.voteAverage,
          )
      ];
    }
    return results;
  }

  @override
  Future<List<MovieEntity>> getPopular() async {
    final data = await dataSourse.getPopular();

    late List<MovieEntity> results;
    if (data == null) {
      results = [];
    } else {
      results = [
        for (final result in data.results)
          MovieEntity(
            originalTitle: result.originalTitle,
            overview: result.overview,
            popularity: result.popularity,
            posterPath: result.posterPath,
            releaseDate: result.releaseDate,
            title: result.title,
            video: result.video,
            voteAverage: result.voteAverage,
          )
      ];
    }
    return results;
  }

  @override
  Future<List<MovieEntity>> getUpcoming() async {
    final data = await dataSourse.getUpcoming();

    late List<MovieEntity> results;
    if (data == null) {
      results = [];
    } else {
      results = [
        for (final result in data.results)
          MovieEntity(
            originalTitle: result.originalTitle,
            overview: result.overview,
            popularity: result.popularity,
            posterPath: result.posterPath,
            releaseDate: result.releaseDate,
            title: result.title,
            video: result.video,
            voteAverage: result.voteAverage,
          )
      ];
    }
    return results;
  }

  @override
  Future<List<MovieEntity>> getToprated() async {
    final data = await dataSourse.getToprated();

    late List<MovieEntity> results;
    if (data == null) {
      results = [];
    } else {
      results = [
        for (final result in data.results)
          MovieEntity(
            originalTitle: result.originalTitle,
            overview: result.overview,
            popularity: result.popularity,
            posterPath: result.posterPath,
            releaseDate: result.releaseDate,
            title: result.title,
            video: result.video,
            voteAverage: result.voteAverage,
          )
      ];
    }
    return results;
  }
}

@riverpod
MovieRepositery movieRepositery(MovieRepositeryRef ref) {
  return MovieRepositeryImpl(
      dataSourse: ref.watch(apiServiceDataSourseProvider));
}
