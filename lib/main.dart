import 'package:flutter/material.dart';
import 'utils/palette.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bold Food',
      theme: ThemeData(
        primarySwatch: Palette.theme,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
