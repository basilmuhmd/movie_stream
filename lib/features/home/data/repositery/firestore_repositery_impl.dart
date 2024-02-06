import 'package:movieapp_cleanarchitrcture/features/home/data/data_sourse/firestore_data_sourse.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/data_sourse/firestore_datasourse_impl.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/models/firestore_model.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/repositery/firestore_repositery.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firestore_repositery_impl.g.dart';

class FireStoreRepositeryImpl implements FireStoreRepositery {
  final FireStoreDataSourse dataSourse;

  FireStoreRepositeryImpl({required this.dataSourse});
  @override
  Future<void> createCollection(MovieEntity entity) async {
    final model = FireStoreModel(
        id: entity.id,
        originalTitle: entity.originalTitle,
        overview: entity.overview,
        popularity: entity.popularity,
        posterPath: entity.posterPath,
        releaseDate: entity.releaseDate,
        title: entity.title,
        video: entity.video,
        voteAverage: entity.voteAverage);
    await dataSourse.createCollection(model);
  }

  @override
  Future<void> deleteCollection(String id) async {
    await dataSourse.deleteCollection(id);
  }

  @override
  Stream<List<MovieEntity>> getCollection() async* {
    final data = dataSourse.getCollection();

    await for (final model in data) {
      yield [
        for (final movieModel in model.docs)
          MovieEntity(
              id: movieModel.data().id,
              originalTitle: movieModel.data().originalTitle,
              overview: movieModel.data().overview,
              popularity: movieModel.data().popularity,
              posterPath: movieModel.data().posterPath,
              releaseDate: movieModel.data().releaseDate,
              title: movieModel.data().title,
              video: movieModel.data().video,
              voteAverage: movieModel.data().voteAverage)
      ];
    }
  }
}

@riverpod
FireStoreRepositery fireStoreRepository(FireStoreRepositoryRef ref) {
  return FireStoreRepositeryImpl(
      dataSourse: ref.watch(fireStoreDataSourseProvider));
}
