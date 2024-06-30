import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MindfulnessExercisesPage extends StatelessWidget {
  final List<Exercise> exercises = [
    Exercise(
        name: 'Raisin Exercise',
        instructions: [
          'Find a Raisin and pretend you’ve never seen it before',
          'Analyze all it’s details',
          'Take in it’s scent',
          'Describe how it feels',
          'Examine it’s taste'
        ],
        funFact:
            'You are unlikely to be consuming energy, time, or attention worrying or ruminating about other aspects of your life if you are concentrating on a raisin',
        youtubeLink: 'https://youtu.be/1umGZ8S8tHo?si=b2sh2mYG7jLjKDfS'),
    Exercise(
        name: 'Body Scan',
        instructions: [
          'Find a comfortable position',
          'Close your eyes and scan your body',
          'Notice any tension and release it',
          'Breathe deeply and slowly',
          'Continue for 5-10 minutes'
        ],
        funFact:
            'Body Scan can help you feel connected to your physical and emotional self, and even help improve your sleep quality',
        youtubeLink: 'https://youtu.be/15q-N-_kkrU'),
    Exercise(
        name: 'Mindful Seeing',
        instructions: [
          'Find a space at a window where there are sights to be seen outside',
          'Observe everything and avoid labels like "bird"; try to notice colors, patterns, textures, etc',
          'See the world from the perspective of someone who is unfamiliar with these sights',
          'Be observant, but not critical - Be aware, but not fixated',
          'If your mind wanders, gently bring it back'
        ],
        funFact:
            'Mindful seeing pushes you to turn outward and engage with the world. It is a practice of being fully present to what is right in front of you',
        youtubeLink: 'https://www.youtube.com/watch?v=CzRgOY53pWI'),
    Exercise(
        name: 'Mindful Listening',
        instructions: [
          'Halt whatever you are doing and offer your full attention',
          'Enjoy a breath as you choose to receive whatever is being communicated to you',
          'Ask yourself if you really know what they mean and if you don’t, ask for clarification',
          'Reflect back to them what you heard'
        ],
        funFact:
            'Listen without judgment, criticism or interruption. Become aware of the thoughts that bother you, and heal yourself from within',
        youtubeLink: 'https://www.youtube.com/watch?v=hBV6hJJeEwg'),
    Exercise(
        name: 'Box Breathing',
        instructions: [
          'Breathe in, counting to four slowly and feel the air enter your lungs',
          'Hold your breath for 4 seconds',
          'Slowly exhale through your mouth for 4 seconds',
          'If your mind wanders, gently bring it back',
          'Repeat until you feel re-centered'
        ],
        funFact:
            'Repeat this exercise as many times as you can. Thirty seconds of deep breathing will help you feel more relaxed and in control',
        youtubeLink: 'https://www.youtube.com/watch?v=tEmt1Znux58'),
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
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ExpansionTile(
              title: Text(
                exercises[index].name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (var instruction in exercises[index].instructions)
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text(
                              '${exercises[index].instructions.indexOf(instruction) + 1}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(instruction, style: TextStyle(fontSize: 15)),
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
                            await launchUrl(url, mode: LaunchMode.externalApplication);
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
            ),
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

  Exercise(
      {required this.name,
      required this.instructions,
      required this.funFact,
      required this.youtubeLink});
}
