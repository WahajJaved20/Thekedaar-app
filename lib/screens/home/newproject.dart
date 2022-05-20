// ignore_for_file: prefer_const_constructors

import 'package:construction_app/firebasehelper/databaseHelper/entityHelper.dart';
import 'package:construction_app/firebasehelper/databaseHelper/projectsHelper.dart';
import 'package:construction_app/models/projectmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class NewProject extends StatefulWidget {
  const NewProject({Key key}) : super(key: key);

  @override
  State<NewProject> createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Material(
            elevation: 20,
            shadowColor: Color.fromARGB(255, 132, 100, 87),
            child: Container(
              color: Color.fromARGB(255, 229, 221, 219),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Center(
                      child: Text("PROJECT DETAILS",
                          style: GoogleFonts.varelaRound(
                            textStyle: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: TextFormField(
                          controller: _nameController,
                          style: GoogleFonts.varelaRound(
                            textStyle: TextStyle(fontSize: 20),
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.work,
                              color: Color.fromARGB(255, 132, 100, 87),
                            ),
                            hintText: "Name",
                            hintStyle: GoogleFonts.varelaRound(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 175, 144, 132)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 132, 100, 87),
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: TextFormField(
                          controller: _startDateController,
                          style: GoogleFonts.varelaRound(
                            textStyle: TextStyle(fontSize: 20),
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.calendar_month,
                              color: Color.fromARGB(255, 132, 100, 87),
                            ),
                            hintText: "Start Date",
                            hintStyle: GoogleFonts.varelaRound(
                              textStyle: TextStyle(fontSize: 20),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 132, 100, 87),
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: TextFormField(
                          controller: _endDateController,
                          style: GoogleFonts.varelaRound(
                            textStyle: TextStyle(fontSize: 20),
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.calendar_month,
                              color: Color.fromARGB(255, 132, 100, 87),
                            ),
                            hintText: "End Date",
                            hintStyle: GoogleFonts.varelaRound(
                              textStyle: TextStyle(fontSize: 20),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 132, 100, 87),
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.08,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.3,
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: ElevatedButton(
                              onPressed: () async {
                                ProjectDatabaseService(uid: user.uid)
                                    .createProject(ProjectModel(
                                        name: _nameController.text,
                                        dateStart: _startDateController.text,
                                        dateEnd: _endDateController.text,
                                        status: true,
                                        isHistory: false));
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 132, 100, 87)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              child: Text(
                                "ADD",
                                style: GoogleFonts.varelaRound(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.08,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.3,
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: ElevatedButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.varelaRound(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
