import 'package:book/view/sign_in.dart';
import 'package:book/view/home.dart';
import 'package:book/view/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor:
          const Color.fromARGB(255, 63, 14, 11), // Set status bar color
      statusBarIconBrightness:
          Brightness.light, // Set status bar icon style (light/dark)
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Test());
  }
}
