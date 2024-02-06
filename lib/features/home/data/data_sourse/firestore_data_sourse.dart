import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/models/firestore_model.dart';

abstract class FireStoreDataSourse {
  Future<void> createCollection(FireStoreModel fireStoreModel);
  Future<void> deleteCollection(String id);
  Stream<QuerySnapshot<FireStoreModel>> getCollection();
}
