import 'dart:developer';

import 'package:construction_app/dbHelper/constants.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var userCollection;
  static var db;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }
}
