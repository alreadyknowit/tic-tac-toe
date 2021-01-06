import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xox_demir/screens/intro.dart';
import 'package:xox_demir/auth/services/database.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Database db = new Database();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: null,
      builder: (context, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: IntroScreen(),
        );
      }
    );
  }
}
