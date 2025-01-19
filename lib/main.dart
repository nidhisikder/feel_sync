import 'package:flutter/material.dart';
import 'screens/welcomepage.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
        body:  WelcomePage(),
      ),

    ),
    );
}




class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
