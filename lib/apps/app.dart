import 'package:firebasedemo/screens/home.dart';
import 'package:firebasedemo/themes/dark.dart';
import 'package:firebasedemo/themes/light.dart';
import 'package:flutter/material.dart';

class FirebaseDemoApp extends StatelessWidget {
  const FirebaseDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
