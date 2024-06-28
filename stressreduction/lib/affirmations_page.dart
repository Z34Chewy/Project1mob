import 'package:flutter/material.dart';
import 'dart:math';

class AffirmationsPage extends StatelessWidget {
  final List<Map<String, dynamic>> affirmations = [
    {
      'affirmation': 'I am calm and relaxed.',
      'description': 'Emphasizes a state of peace and tranquility, promoting relaxation.',
      'backgroundColor': Colors.lightBlueAccent,
    },
    {
      'affirmation': 'I can handle whatever comes my way.',
      'description': 'Encourages confidence in facing challenges with resilience.',
      'backgroundColor': Colors.greenAccent,
    },
    {
      'affirmation': 'I am in control of my stress levels.',
      'description': 'Affirms personal control over stress management and reduction.',
      'backgroundColor': Colors.orangeAccent,
    },
    {
      'affirmation': 'I am worthy of peace and happiness.',
      'description': 'Recognizes self-worth and deservingness of positive emotions.',
      'backgroundColor': Colors.pinkAccent,
    },
    {
      'affirmation': 'I choose to respond to challenges with calmness and clarity.',
      'description': 'Promotes intentional and composed responses to difficulties.',
      'backgroundColor': Colors.lightGreenAccent,
    },
    {
      'affirmation': 'Every day in every way, I am getting better and better.',
      'description': 'Fosters a growth mindset and continuous self-improvement.',
      'backgroundColor': Colors.purpleAccent,
    },
    {
      'affirmation': 'I am surrounded by love and everything is fine.',
      'description': 'Creates a sense of security and contentment through love.',
      'backgroundColor': Colors.redAccent,
    },
    {
      'affirmation': 'I am a unique and special person.',
      'description': 'Celebrates individuality and uniqueness in self-perception.',
      'backgroundColor': Colors.blueAccent,
    },
    {
      'affirmation': 'I am doing the best I can, and it is enough.',
      'description': 'Affirms self-acceptance and satisfaction with personal efforts.',
      'backgroundColor': Colors.tealAccent,
    },
    {
      'affirmation': 'I deserve to feel good about myself.',
      'description': 'Reinforces self-esteem and acknowledges deserving positive feelings.',
      'backgroundColor': Colors.amberAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final Map<String, dynamic> randomAffirmation = affirmations[random.nextInt(affirmations.length)];

    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Affirmation'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        color: randomAffirmation['backgroundColor'] ?? Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  randomAffirmation['affirmation'] ?? '',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  randomAffirmation['description'] ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
