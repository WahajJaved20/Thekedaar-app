import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: ElevatedButton(
      child: Text('lol'),
      onPressed: () => print('sheesh'),
    ));
  }
}
