import 'package:construction_app/firebasehelper/auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return FloatingActionButton(
      onPressed: () {
        _auth.signOut();
      },
      child: Text('Sign out'),
    );
  }
}
