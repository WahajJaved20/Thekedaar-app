// ignore_for_file: unnecessary_new, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:construction_app/firebasehelper/databaseHelper/projectsHelper.dart';
import 'package:construction_app/models/projectmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../models/EntityModel.dart';
import '../../../../models/user.dart';

class NewProjectScreen2 extends StatefulWidget {
  final name, startDate, endDate;
  final List<String> entities;
  NewProjectScreen2({this.entities, this.name, this.startDate, this.endDate});

  @override
  State<NewProjectScreen2> createState() => _NewProjectScreen2State();
}

class _NewProjectScreen2State extends State<NewProjectScreen2> {
  List<TextEditingController> controller = [
    new TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                TextEditingController _control = addController();

                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            widget.entities[index],
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: new TextFormField(
                            controller: _control,
                            style: GoogleFonts.varelaRound(
                              textStyle: TextStyle(fontSize: 20),
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.money,
                                color: Theme.of(context).primaryColor,
                              ),
                              hintText: "Amount",
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
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: widget.entities.length,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.3,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Text(
                  "Back",
                  style: GoogleFonts.varelaRound(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.3,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: ElevatedButton(
                onPressed: () {
                  List<Entity> en = [];
                  for (int i = 0; i < widget.entities.length; i++) {
                    en.add(Entity(
                        id: (i + 1).toString(),
                        amount: int.parse(controller[i + 1].text.isEmpty
                            ? 0
                            : controller[i + 1].text),
                        name: widget.entities[i]));
                  }
                  List<Map<String, dynamic>> e = [];
                  en.forEach((element) => e.add(element.toJson()));

                  ProjectDatabaseService(uid: user.uid).createProject(
                    ProjectModel(
                        name: widget.name,
                        dateStart: widget.startDate,
                        dateEnd: widget.endDate.isEmpty ? ' ' : widget.endDate,
                        isHistory: false,
                        status: widget.endDate.isEmpty ? true : false,
                        entityList: e),
                  );
                  setState(() {});
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Text(
                  "CONFIRM",
                  style: GoogleFonts.varelaRound(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController addController() {
    TextEditingController _control = new TextEditingController();
    controller.add(_control);
    return _control;
  }
}
