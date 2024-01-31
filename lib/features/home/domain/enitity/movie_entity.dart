import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_entity.freezed.dart';

@freezed
class MovieEntity with _$MovieEntity {
  const factory MovieEntity({
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required DateTime releaseDate,
    required String title,
    required bool video,
    required double voteAverage,
  }) = _MovieEntity;
}
