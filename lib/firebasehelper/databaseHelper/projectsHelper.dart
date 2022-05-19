// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/entities.dart';
import '../../models/projectmodel.dart';
import '../../models/user.dart';

class ProjectDatabaseService {
  final String uid;
  ProjectDatabaseService({this.uid});
  final CollectionReference projectCollection =
      FirebaseFirestore.instance.collection('Projects');
  // add or update a project
  Future<void> updateUserData(
      String name,
      List<ProjectModel> history,
      bool isHistory,
      String dateStart,
      String dateEnd,
      bool status,
      List<Entities> entityList) async {
    return await projectCollection.doc(uid).set({
      'name': name,
      'history': history,
      'isHistory': isHistory,
      'dateStart': dateStart,
      'dateEnd': dateEnd,
      'status': status,
      'entityList': entityList
    });
  }

  List<ProjectModel> _projectListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      print(doc.data);
      print('damn we here');
      return ProjectModel(
          name: doc['name'] ?? '',
          history: doc['history'],
          isHistory: doc['isHistory'],
          dateStart: doc['dateStart'],
          dateEnd: doc['dateEnd'],
          status: doc['status'],
          entityList: doc['entityList']);
    }).toList();
  }

  // UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return UserData(uid: uid, projects: snapshot.data());
  // }

  Stream<List<ProjectModel>> get projects {
    return projectCollection.snapshots().map(_projectListFromSnapshot);
  }

  // Stream<UserData> get userData {
  //   return projectCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  // }
}
