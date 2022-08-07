import 'package:flutter/material.dart';
import 'package:flutter_application_20/injection.dart';
import 'package:flutter_application_20/modules/home_screen/home_screen.dart';

void main() {
  runApp(MyApp());
  init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HOmeScreen(),
    );
  }
}
