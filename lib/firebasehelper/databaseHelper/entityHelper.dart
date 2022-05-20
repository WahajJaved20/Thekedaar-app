import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:construction_app/models/EntityModel.dart';

class EntityDatabaseService {
  Stream<List<Entity>> readEntities() => FirebaseFirestore.instance
      .collection('Entities')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((e) => Entity.fromJson(e.data())).toList());
}
