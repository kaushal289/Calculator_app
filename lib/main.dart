import 'package:calculater_app/claculator_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter for class',
      initialRoute: '/',
      routes: {
        '/': (context) => const CalculatorScreen(),
      },
    ),
  );
}