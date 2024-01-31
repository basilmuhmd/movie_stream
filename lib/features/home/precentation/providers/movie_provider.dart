import 'package:movieapp_cleanarchitrcture/features/home/data/repositery/movie_repositery_impl.dart';

import 'package:movieapp_cleanarchitrcture/features/home/domain/usecases/movie_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/usecases/populer_movie_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/usecases/top_rated_movies_usecase.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/usecases/upcoming_movie_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/providers/movie_state_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_provider.g.dart';

@riverpod
class Movie extends _$Movie {
  @override
  Future<MovieProviderState> build() async {
    final repositery = ref.watch(movieRepositeryProvider);
    final result = await Future.wait([
      MoviesUsecase(repositery: repositery)(),
      PopulerUsecase(repositery: repositery)(),
      UpcomingUsecases(repositery: repositery)(),
      TopRatedMoviesUsecases(repositery: repositery)(),
    ]);

    return MovieProviderState(
        getMovies: result[0],
        getPopular: result[1],
        getUpcoming: result[2],
        getToprated: result[3]);
  }
}
