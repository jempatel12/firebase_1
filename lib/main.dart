import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notped_firebase/screens/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/' :(context) => HomePage(),
      },
    ),
  );
}