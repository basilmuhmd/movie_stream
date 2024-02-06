import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/data_sourse/firestore_data_sourse.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/models/firestore_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firestore_datasourse_impl.g.dart';

class FireStoreDataSourseImpl implements FireStoreDataSourse {
  final movieRef =
      FirebaseFirestore.instance.collection("Movie_Data").withConverter(
            fromFirestore: FireStoreModel.fromFirestore,
            toFirestore: (FireStoreModel storeModel, options) =>
                storeModel.toFirestore(),
          );

  @override
  Future<void> createCollection(FireStoreModel fireStoreModel) async {
    final movieDoc = movieRef.doc(fireStoreModel.id.toString());
    await movieDoc.set(fireStoreModel);
  }

  @override
  Future<void> deleteCollection(String id) async {
    await movieRef.doc(id).delete();
  }

  @override
  Stream<QuerySnapshot<FireStoreModel>> getCollection() {
    return movieRef.snapshots();
  }
}

@riverpod
FireStoreDataSourse fireStoreDataSourse(FireStoreDataSourseRef ref) {
  return FireStoreDataSourseImpl();
}
