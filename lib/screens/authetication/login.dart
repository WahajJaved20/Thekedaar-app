// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:construction_app/constants/titleApp.dart';
import 'package:construction_app/screens/authetication/form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Material(
            elevation: 20,
            shadowColor: Theme.of(context).primaryColor,
            child: Container(
              color: Color.fromARGB(255, 229, 221, 219),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: <Widget>[
                  AppName(),
                  FormScreen(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
