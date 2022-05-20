// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:construction_app/firebasehelper/databaseHelper/entityList.dart';
import '../../models/projectmodel.dart';

class ProjectDatabaseService {
  final String uid;
  ProjectDatabaseService({this.uid});

  Future<String> createProject(ProjectModel mod) async {
    final projectCollection = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Projects')
        .doc();
    mod.id = projectCollection.id;
    await projectCollection.set(mod.toJson());
    return projectCollection.id;
  }

  Future updateProject(ProjectModel mod) async {
    final collection = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Projects')
        .doc(mod.id);
    await collection.update(mod.toJson());
  }

  Future deleteProject(ProjectModel mod) async {
    final collection = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Projects')
        .doc(mod.id);
    await collection.delete();
  }

  Stream<List<ProjectModel>> readProjects() => FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('Projects')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((e) => ProjectModel.fromJson(e.data())).toList());
}
