// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:construction_app/constants/loginButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                    color: Theme.of(context).primaryColor,
                  ),
                  hintText: "Username",
                  hintStyle: GoogleFonts.varelaRound(
                    textStyle: TextStyle(
                        fontSize: 20, color: Theme.of(context).backgroundColor),
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
                    color: Theme.of(context).primaryColor,
                  ),
                  suffixIcon: hideText
                      ? IconButton(
                          padding: EdgeInsets.only(bottom: 10),
                          onPressed: changeHiddenState,
                          icon: Icon(Icons.remove_red_eye),
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
                      color: Theme.of(context).primaryColor,
                      width: 4,
                    ),
                  ),
                ),
              ),
            ),
          ),
          LoginButton(
            username: _usernameController,
            password: _passwordController,
          ),
        ],
      ),
    );
  }
}
