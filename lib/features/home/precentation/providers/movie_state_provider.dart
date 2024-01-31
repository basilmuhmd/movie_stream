import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';
part 'movie_state_provider.freezed.dart';

@freezed
class MovieProviderState with _$MovieProviderState {
  factory MovieProviderState(
      {required List<MovieEntity> getMovies,
      required List<MovieEntity> getPopular,
      required List<MovieEntity> getUpcoming,
      required List<MovieEntity> getToprated}) = _MovieProviderState;
}
