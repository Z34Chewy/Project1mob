import 'package:flutter/material.dart';

class MindfulnessPage extends StatelessWidget {
  final List<String> exercises = [
    'Deep Breathing',
    'Body Scan',
    'Mindful Walking',
    'Loving-Kindness Meditation',
    'Mindful Eating',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindfulness Exercises'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(exercises[index]),
            onTap: () {
              // Add any action or detailed view for each exercise here
            },
          );
        },
      ),
    );
  }
}
