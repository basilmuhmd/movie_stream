import 'package:movieapp_cleanarchitrcture/core/exception/base_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/repositery/firestore_repositery.dart';

final class FireStoreUsecase {
  final FireStoreRepositery repository;
  FireStoreUsecase({required this.repository});

  Future<void> call(MovieEntity model) async {
    try {
      return await repository.createCollection(model);
    } catch (e) {
      throw BaseException('Error');
    }
  }
}
