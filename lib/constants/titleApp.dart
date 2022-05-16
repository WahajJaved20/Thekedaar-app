// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
      child: Text(
        'THEKEDAAR',
        style: GoogleFonts.varelaRound(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
