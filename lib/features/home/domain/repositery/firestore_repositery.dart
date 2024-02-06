import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';

abstract class FireStoreRepositery {
  Future<void> createCollection(MovieEntity fireStoreModel);
  Future<void> deleteCollection(String id);
  Stream<List<MovieEntity>> getCollection();
}
