// ignore_for_file: file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../firebasehelper/auth.dart';

class LoginButton extends StatefulWidget {
  var username;
  var password;
  LoginButton({this.username, this.password});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.08,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.6,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: ElevatedButton(
          onPressed: () async {
            dynamic result = await _auth.signInWithEmailAndPassword(
                widget.username.text.trim(), widget.password.text.trim());
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 132, 100, 87)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          child: Text(
            "LOGIN",
            style: GoogleFonts.varelaRound(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
