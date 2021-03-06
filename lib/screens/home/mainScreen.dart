// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:construction_app/screens/home/Entity/list_entity.dart';
import 'package:construction_app/screens/home/Project/Project.dart';
import 'package:construction_app/screens/home/Settings/Settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> navigationOptions = <Widget>[
    Projects(),
    EntityList(),
    Settings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Entities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
