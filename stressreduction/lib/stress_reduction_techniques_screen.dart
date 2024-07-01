import 'package:flutter/material.dart';
import 'technique_details_screen.dart';

class StressReductionTechniquesScreen extends StatelessWidget {
  const StressReductionTechniquesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stress Reduction Techniques'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
            const SizedBox(height: 20),
            TechniqueButton('Journaling', context),
            TechniqueButton('Positive Affirmations', context),
            TechniqueButton('Adequate Sleep', context),
            TechniqueButton('Time Management', context),
            TechniqueButton('Massage Therapy', context),
          ],
        ),
      ),
    );
  }

  Widget TechniqueButton(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.grey,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TechniqueDetailsScreen(technique: title),
            ),
          );
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}