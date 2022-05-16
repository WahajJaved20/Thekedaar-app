import 'package:construction_app/models/user.dart';
import 'package:construction_app/screens/authetication/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    if (user == null) {
      return LoginScreen();
    }
    return Text('bruh');
  }
}
