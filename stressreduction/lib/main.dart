import 'package:flutter/material.dart';
import 'dart:math'; // Import dart:math for random number generation

void main() {
  runApp(MindfulnessApp());
}

class MindfulnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mindfulness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Mindfulness App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome to the Mindfulness & Stress Reduction App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'This app is designed to help you practice mindfulness, reduce stress, and boost your mental well-being with daily affirmations.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Developed by [Your Name] and [Your Team/Company Name]. We hope you find peace and happiness through our app!',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MindfulnessPage()),
                      );
                    },
                    child: Text('Mindfulness Exercises'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StressReductionPage()),
                      );
                    },
                    child: Text('Stress Reduction Techniques'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AffirmationsPage()),
                      );
                    },
                    child: Text('Daily Affirmations'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class StressReductionPage extends StatelessWidget {
  final List<String> techniques = [
    'Progressive Muscle Relaxation',
    'Guided Imagery',
    'Yoga',
    'Tai Chi',
    'Listening to Music',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stress Reduction Techniques'),
      ),
      body: ListView.builder(
        itemCount: techniques.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(techniques[index]),
            onTap: () {
              // Add any action or detailed view for each technique here
            },
          );
        },
      ),
    );
  }
}

class AffirmationsPage extends StatelessWidget {
  final List<String> affirmations = [
    'I am calm and relaxed.',
    'I can handle whatever comes my way.',
    'I am in control of my stress levels.',
    'I am worthy of peace and happiness.',
    'I choose to respond to challenges with calmness and clarity.',
    'Every day in every way, I am getting better and better.',
    'I am surrounded by love and everything is fine.',
    'I am a unique and special person.',
    'I am doing the best I can, and it is enough.',
    'I deserve to feel good about myself.'
  ];

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final String randomAffirmation = affirmations[random.nextInt(affirmations.length)];

    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Affirmation'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            randomAffirmation,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
