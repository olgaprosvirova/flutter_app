import 'package:flutter/material.dart';
import 'package:flutter_app/screens/secondscreen.dart';
import 'screens/firstscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => FirstScreen(),
          '/second': (context) => SecondScreen(),
        }
    );
  }
}



