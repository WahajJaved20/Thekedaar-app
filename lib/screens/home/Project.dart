import 'package:construction_app/firebasehelper/databaseHelper/projectsHelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class Projects extends StatefulWidget {
  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return Scaffold(
        floatingActionButton: ElevatedButton(
      child: Text('lol'),
      onPressed: () {
        var a = ProjectDatabaseService(uid: user.uid).projects;
        print('damn we here');
      },
    ));
  }
}
