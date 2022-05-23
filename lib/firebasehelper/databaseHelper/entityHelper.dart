import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:construction_app/firebasehelper/databaseHelper/entityList.dart';
import 'package:construction_app/models/EntityModel.dart';

class EntityDatabaseService {
  List<String> en;
  Future<List<String>> readEntities() async {
    try {
      final DocumentReference documents = FirebaseFirestore.instance
          .collection('Entities')
          .doc('YMeIZstEAwa5DMh5phG3');
      var snapshot = await documents.get();
      Map<String, dynamic> data = snapshot.data();

      return data['entityList'].cast<String>();
    } catch (e) {
      print(e);
    }
  }
}
