import 'package:flutter/material.dart';
import 'stress_reduction_techniques_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mindfulness and Stress Reduction',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const StressReductionTechniquesScreen(), // Set the initial screen
    );
  }
}
