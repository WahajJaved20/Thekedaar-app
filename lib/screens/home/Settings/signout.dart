// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:construction_app/firebasehelper/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signout extends StatelessWidget {
  final AuthService auth;
  Signout({this.auth});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => auth.signOut(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Theme.of(context).backgroundColor),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout),
              Padding(padding: EdgeInsets.only(right: 10)),
              Text(
                "Sign out",
                style: GoogleFonts.varelaRound(
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
