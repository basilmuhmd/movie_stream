import 'package:movieapp_cleanarchitrcture/core/exception/base_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/repositery/firestore_repositery.dart';

final class FireStoreGetUsecase {
  final FireStoreRepositery repository;
  FireStoreGetUsecase({required this.repository});

  Stream<List<MovieEntity>> call() {
    try {
      return repository.getCollection();
    } catch (e) {
      throw BaseException('Error');
    }
  }
}
