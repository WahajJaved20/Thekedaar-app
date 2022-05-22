// ignore_for_file: prefer_const_constructors, missing_return, use_key_in_widget_constructors

import 'package:construction_app/firebasehelper/databaseHelper/projectsHelper.dart';
import 'package:construction_app/models/projectmodel.dart';
import 'package:construction_app/screens/home/Project/addProject/newproject.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../firebasehelper/databaseHelper/entityHelper.dart';
import '../../../models/user.dart';

class Projects extends StatefulWidget {
  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 132, 100, 87),
        onPressed: () async {
          List<String> entities = [];
          var a = await EntityDatabaseService().readEntities();
          setState(() {
            entities = a;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewProject(entities: entities)),
          );
        },
      ),
      body: StreamBuilder<List<ProjectModel>>(
        stream: ProjectDatabaseService(uid: user.uid).readProjects(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final projects = snapshot.data;
            return ListView(
              children: projects.map(buildPro).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildPro(ProjectModel mod) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.18,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01,
          vertical: MediaQuery.of(context).size.height * 0.02),
      child: Material(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        color: Color.fromARGB(255, 183, 169, 163),
        shadowColor: Color.fromARGB(255, 192, 177, 173),
        elevation: 10,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 30, top: 25),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(children: <Widget>[
                Row(
                  children: [
                    Text(
                      mod.name,
                      style: GoogleFonts.varelaRound(
                          color: Color.fromARGB(255, 78, 69, 69),
                          textStyle: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w900)),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      "Start Date: ${mod.dateStart}",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Text(
                      "End Date: ${mod.status ? " " : mod.dateEnd}",
                      style: GoogleFonts.varelaRound(
                          textStyle: TextStyle(fontSize: 15)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Status: ${mod.status ? "Ongoing" : "Closed"}",
                      style: GoogleFonts.varelaRound(
                          textStyle: TextStyle(fontSize: 15)),
                    ),
                  ],
                )
              ]),
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              alignment: Alignment.centerRight,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      onPressed: () => print('bruh'),
                      label: Text('Edit',
                          style: GoogleFonts.varelaRound(
                              textStyle: TextStyle(fontSize: 15),
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 78, 69, 69)))),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      onPressed: () => print('bruh'),
                      label: Text('Delete',
                          style: GoogleFonts.varelaRound(
                              textStyle: TextStyle(fontSize: 15),
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 78, 69, 69),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
