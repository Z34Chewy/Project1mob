import 'package:flutter/material.dart';

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
        backgroundColor: Theme.of(context).colorScheme.primary,
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
