import 'package:flutter/material.dart';
import 'package:the_jewel/ui/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // delete deug banner from emulator
      home: StartScreen(),
    );
  }
}
