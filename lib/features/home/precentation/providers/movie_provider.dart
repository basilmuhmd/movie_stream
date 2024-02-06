import 'package:movieapp_cleanarchitrcture/features/home/data/data_sourse/comment_firestore_impl_datasourse.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/data_sourse/firestore_datasourse_impl.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/models/firestore_model.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/repositery/comment_repositery_impl.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/repositery/firestore_repositery_impl.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/repositery/movie_repositery_impl.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/comment_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/repositery/firestore_repositery.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/usecases/comment_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/usecases/delete_comment_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/usecases/firestore_deleteusecases.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/usecases/firestore_get_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/usecases/firestore_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/usecases/get_comment_usecases.dart';

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

  Future<void> createFireStoreCollection(MovieEntity entity) {
    return FireStoreUsecase(repository: ref.watch(fireStoreRepositoryProvider))(
        entity);
  }

  Future<void> deleteFirStoreCollection(String id) {
    return FireStoreDeleteUsecase(
        repository: ref.watch(fireStoreRepositoryProvider))(id);
  }

  Stream<List<MovieEntity>> getCollection() {
    return FireStoreGetUsecase(
        repository: ref.watch(fireStoreRepositoryProvider))();
  }

  Future<void> addCommentCollection(
    CommentEntity entity,
    String id,
  ) {
    return CommentUsecases(repositery: ref.watch(commentRepositeryProvider))(
        entity, id);
  }

  Future<void> deleteComment(String id) {
    return DeleteCommentUsecases(
        repositery: ref.watch(commentRepositeryProvider))(id);
  }

  Stream<List<CommentEntity>> getCommentCollection(String id) {
    return GetCommentUsescases(
        repositery: ref.watch(commentRepositeryProvider))(id);
  }
}
