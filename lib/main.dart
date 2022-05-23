// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:construction_app/screens/handler/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebasehelper/auth.dart';
import 'firebasehelper/databaseHelper/entityHelper.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyC6MuvsMy5dQqmJ0F_fAPRs99ag6pChRAg",
          authDomain: "thekedaar-53a8f.firebaseapp.com",
          projectId: "thekedaar-53a8f",
          storageBucket: "thekedaar-53a8f.appspot.com",
          messagingSenderId: "606046267293",
          appId: "1:606046267293:web:beaaeaabbcdb63f88ef174",
          measurementId: "G-CQ5S6X3G0Y"));
  runApp(FutureProvider<List<String>>(
    create: (_) => EntityDatabaseService().readEntities(),
    initialData: ["Nothing here"],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: Color.fromARGB(255, 132, 100, 87),
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
            backgroundColor: Color.fromARGB(255, 175, 144, 132),
          ),
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ),
        value: AuthService().user,
        initialData: null);
  }
}
