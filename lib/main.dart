import 'package:flutter/material.dart';
import 'screens/list_screen.dart';


void main() {
  runApp(const ICTAPP());
}

class ICTAPP extends StatelessWidget {
  const ICTAPP({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListScreen(),
    );
  }
}