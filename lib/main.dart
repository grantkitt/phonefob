import 'package:flutter/material.dart';
import 'package:phonefob/constants.dart';
import 'package:phonefob/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Phone Fob',
        theme: ThemeData(backgroundColor: kBackground),
        home: HomeScreen());
  }
}
