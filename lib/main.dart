import 'package:flutter/material.dart';
import 'utils/palette.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boldfood',
      theme: ThemeData(
        primarySwatch: Palette.theme,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
