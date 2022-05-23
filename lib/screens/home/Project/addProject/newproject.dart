// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../models/user.dart';

class NewProject extends StatefulWidget {
  List<String> entities = [];
  NewProject({this.entities});

  @override
  State<NewProject> createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  List<String> selectedEntities = [];
  @override
  Widget build(BuildContext context) {
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
                              color: Theme.of(context).primaryColor,
                            ),
                            hintText: "Name",
                            hintStyle: GoogleFonts.varelaRound(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).backgroundColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
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
                              color: Theme.of(context).primaryColor,
                            ),
                            hintText: "Start Date",
                            hintStyle: GoogleFonts.varelaRound(
                              textStyle: TextStyle(fontSize: 20),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
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
                              color: Theme.of(context).primaryColor,
                            ),
                            hintText: "End Date",
                            hintStyle: GoogleFonts.varelaRound(
                              textStyle: TextStyle(fontSize: 20),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          onChanged: (value) => value,
                          isDense: true,
                          hint: Text("Add Entity"),
                          items: widget.entities
                              .map((e) => DropdownMenuItem<String>(
                                  onTap: () {
                                    setState(() {
                                      if (selectedEntities.contains(e)) {
                                        selectedEntities.remove(e);
                                      } else {
                                        selectedEntities.add(e);
                                      }
                                    });
                                  },
                                  value: e,
                                  child: Row(
                                    children: <Widget>[
                                      // ignore: missing_required_param
                                      Checkbox(
                                        value: selectedEntities.contains(e)
                                            ? true
                                            : false,
                                      ),
                                      Text(e)
                                    ],
                                  )))
                              .toList(),
                        ),
                      ),
                    )),
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
                              onPressed: () {
                                // create one
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              child: Text(
                                "NEXT",
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
                        ),
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
