// ignore_for_file: file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../firebasehelper/auth.dart';

class LoginButton extends StatelessWidget {
  final username;
  final password;
  LoginButton({this.username, this.password});
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
            print(username);
            print(password);
            dynamic result =
                await _auth.signInWithEmailAndPassword(username, password);
            if (result != null) {
              print("LESS GOO");
            }
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