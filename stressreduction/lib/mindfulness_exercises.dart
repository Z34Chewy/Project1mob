import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MindfulnessExercisesPage extends StatelessWidget {
  final List<Exercise> exercises = [
    Exercise(
      name: 'Exercise 1',
      instructions: [
        'Find a quiet place to sit.',
        'Close your eyes and take deep breaths.',
        'Focus on your breathing.',
        'If your mind wanders, gently bring it back.',
        'Continue for 5-10 minutes.'
      ],
      funFact: 'Did you know? Deep breathing can lower stress hormones in your body.',
      youtubeLink: 'https://www.youtube.com/watch?v=inpok4MKVLM'
    ),
    Exercise(
      name: 'Exercise 2',
      instructions: [
        'Find a comfortable position.',
        'Close your eyes and scan your body.',
        'Notice any tension and release it.',
        'Breathe deeply and slowly.',
        'Continue for 5-10 minutes.'
      ],
      funFact: 'Fun Fact: Body scan meditation can help improve sleep quality.',
      youtubeLink: 'https://www.youtube.com/watch?v=ihO02wUzgkc'
    ),
    Exercise(
      name: 'Exercise 3',
      instructions: [
        'Find a quiet place to sit.',
        'Close your eyes and take deep breaths.',
        'Focus on your breathing.',
        'If your mind wanders, gently bring it back.',
        'Continue for 5-10 minutes.'
      ],
      funFact: 'Did you know? Deep breathing can lower stress hormones in your body.',
      youtubeLink: 'https://www.youtube.com/watch?v=inpok4MKVLM'
    ),
    Exercise(
      name: 'Exercise 4',
      instructions: [
        'Find a quiet place to sit.',
        'Close your eyes and take deep breaths.',
        'Focus on your breathing.',
        'If your mind wanders, gently bring it back.',
        'Continue for 5-10 minutes.'
      ],
      funFact: 'Did you know? Deep breathing can lower stress hormones in your body.',
      youtubeLink: 'https://www.youtube.com/watch?v=inpok4MKVLM'
    ),
    Exercise(
      name: 'Exercise 5',
      instructions: [
        'Find a quiet place to sit.',
        'Close your eyes and take deep breaths.',
        'Focus on your breathing.',
        'If your mind wanders, gently bring it back.',
        'Continue for 5-10 minutes.'
      ],
      funFact: 'Did you know? Deep breathing can lower stress hormones in your body.',
      youtubeLink: 'https://www.youtube.com/watch?v=inpok4MKVLM'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindfulness Exercises'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(exercises[index].name),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var instruction in exercises[index].instructions)
                      ListTile(
                        leading: Icon(Icons.check_circle),
                        title: Text(instruction),
                      ),
                    SizedBox(height: 10),
                    Text(
                      exercises[index].funFact,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () async {
                        final url = Uri.parse(exercises[index].youtubeLink);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(
                        'Watch Tutorial',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Exercise {
  final String name;
  final List<String> instructions;
  final String funFact;
  final String youtubeLink;

  Exercise({required this.name, required this.instructions, required this.funFact, required this.youtubeLink});
}
