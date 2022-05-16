// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:construction_app/constants/loginButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool hideText = true;
  void changeHiddenState() {
    setState(() {
      hideText = !hideText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: TextFormField(
                controller: _usernameController,
                style: GoogleFonts.varelaRound(
                  textStyle: TextStyle(fontSize: 20),
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 132, 100, 87),
                  ),
                  hintText: "Username",
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
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: TextFormField(
                controller: _passwordController,
                style: GoogleFonts.varelaRound(
                  textStyle: TextStyle(fontSize: 20),
                ),
                obscureText: hideText,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 132, 100, 87),
                  ),
                  suffixIcon: hideText
                      ? IconButton(
                          padding: EdgeInsets.only(bottom: 10),
                          onPressed: changeHiddenState,
                          icon: Icon(Icons.security),
                        )
                      : IconButton(
                          padding: EdgeInsets.only(bottom: 10),
                          onPressed: changeHiddenState,
                          icon: Icon(Icons.remove_red_eye_outlined),
                        ),
                  hintText: "Password",
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
          LoginButton(
            username: _usernameController.text,
            password: _passwordController.text,
          ),
        ],
      ),
    );
  }
}
