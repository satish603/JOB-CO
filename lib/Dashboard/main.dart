import 'package:flutter/material.dart';
import 'package:flutter1_app/first_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, 
    home:Dashboard(),
    );
  }
}
