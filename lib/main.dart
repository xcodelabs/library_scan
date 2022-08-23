import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:library_scan/screen/home.dart';
import 'package:library_scan/screen/login.dart';
import 'package:library_scan/screen/primary.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Library_scan());
}

class Library_scan extends StatelessWidget {
  const Library_scan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: primary(),
    );
  }
}
