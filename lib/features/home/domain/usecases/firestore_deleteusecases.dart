import 'package:movieapp_cleanarchitrcture/core/exception/base_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/repositery/firestore_repositery.dart';

final class FireStoreDeleteUsecase {
  final FireStoreRepositery repository;

  FireStoreDeleteUsecase({required this.repository});

  Future<void> call(String id) async {
    try {
      return await repository.deleteCollection(id);
    } catch (e) {
      throw BaseException('Error');
    }
  }
}
