// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../firebasehelper/databaseHelper/entityHelper.dart';

class EntityList extends StatefulWidget {
  const EntityList({Key key}) : super(key: key);

  @override
  State<EntityList> createState() => _EntityListState();
}

class _EntityListState extends State<EntityList> {
  @override
  Widget build(BuildContext context) {
    return nameList();
  }

  Widget nameList() {
    final entities = Provider.of<List<String>>(context);
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(height: 3, thickness: 0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            color: Theme.of(context).primaryColor,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Text(
                entities[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
      itemCount: entities.length,
    );
  }
}
