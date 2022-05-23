import 'package:construction_app/firebasehelper/auth.dart';
import 'package:construction_app/screens/home/Settings/signout.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Signout(auth: _auth),
      ),
    );
  }
}
