import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StressReductionTechniquesScreen extends StatefulWidget {
  const StressReductionTechniquesScreen({Key? key}) : super(key: key);

  @override
  _StressReductionTechniquesScreenState createState() =>
      _StressReductionTechniquesScreenState();
}

class _StressReductionTechniquesScreenState
    extends State<StressReductionTechniquesScreen> {
  final List<Technique> techniques = [
    Technique(
        name: 'Journaling',
        instructions: [
          'Set a Routine: Dedicate a specific time each day for journaling, such as first thing in the morning or before bed. Consistency helps make journaling a habit.',
          'Be Honest: Write openly and honestly without worrying about grammar or spelling. Journaling is for your eyes only, so it\'s important to express your true thoughts and feelings.',
          'Reflect on Entries: Periodically review your past entries to identify patterns, progress, and recurring themes in your thoughts and behaviors.',
        ],
        funFact:
            'Journaling helps clarify thoughts and emotions, promoting emotional well-being.',
        youtubeLink: 'https://www.youtube.com/watch?v=7CcZ7gyFXv0'),
    Technique(
        name: 'Positive Affirmations',
        instructions: [
          'Create Personalized Affirmations: Tailor affirmations to address your specific needs and goals. For example, if you\'re dealing with anxiety, an affirmation might be, "I am calm and at peace."',
          'Use Present Tense: Phrase affirmations in the present tense, as if they are already true. This helps reinforce the desired mindset. For example, say "I am confident" instead of "I will be confident."',
          'Repeat Daily: Repeat your affirmations multiple times a day, ideally in the morning and before bed. Consistent repetition helps reinforce positive beliefs.',
        ],
        funFact:
            'Positive affirmations can rewire the brain to replace negative thoughts with positive ones.',
        youtubeLink: 'https://www.youtube.com/watch?v=y_GWW2xDgVA'),
    Technique(
        name: 'Adequate Sleep',
        instructions: [
          'Establish a Sleep Routine: Go to bed and wake up at the same time every day, even on weekends. This helps regulate your body\'s internal clock.',
          'Create a Sleep-Friendly Environment: Keep your bedroom dark, cool, and quiet. Use blackout curtains, earplugs, or a white noise machine if necessary.',
          'Relaxing Bedtime Routine: Develop a calming pre-sleep routine, such as reading a book, taking a warm bath, or practicing relaxation techniques like deep breathing or meditation.',
        ],
        funFact:
            'Adequate sleep improves cognitive function, mood, and overall health.',
        youtubeLink: 'https://www.youtube.com/watch?v=IzQ2siryQrM'),
    Technique(
        name: 'Time Management',
        instructions: [
          'Prioritize Tasks: Identify and focus on your most important tasks first. Use methods like the Eisenhower Matrix to categorize tasks by urgency and importance.',
          'Use a Planner: Utilize a planner or digital calendar to organize your daily schedule, set deadlines, and keep track of appointments and commitments.',
          'Break Tasks into Smaller Steps: Divide larger projects into smaller, more manageable tasks. This makes them less overwhelming and easier to tackle.',
        ],
        funFact:
            'Effective time management reduces stress and increases productivity.',
        youtubeLink: 'https://www.youtube.com/watch?v=-f30i_WlP6g'),
    Technique(
        name: 'Massage Therapy',
        instructions: [
          'Choose the Right Type: Different types of massage (Swedish, deep tissue, aromatherapy) serve different purposes. Research and choose the one that best suits your needs.',
          'Communicate with Your Therapist: Clearly communicate your preferences, pain points, and any health concerns with your massage therapist to ensure a personalized and effective session.',
          'Stay Hydrated: Drink plenty of water before and after your massage. Hydration helps flush out toxins released during the massage and reduces muscle soreness.',
        ],
        funFact:
            'Massage therapy relieves muscle tension and promotes relaxation.',
        youtubeLink: 'https://www.youtube.com/watch?v=CkapVK9hsb0'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stress Reduction Techniques'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: techniques.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ExpansionTile(
              title: Text(
                techniques[index].name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (var instruction in techniques[index].instructions)
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text(
                              '${techniques[index].instructions.indexOf(instruction) + 1}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(instruction,
                              style: const TextStyle(fontSize: 15)),
                        ),
                      const SizedBox(height: 10),
                      Text(
                        techniques[index].funFact,
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {
                          final url = Uri.parse(techniques[index].youtubeLink);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const Text(
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

class Technique {
  final String name;
  final List<String> instructions;
  final String funFact;
  final String youtubeLink;

  Technique({
    required this.name,
    required this.instructions,
    required this.funFact,
    required this.youtubeLink,
  });
}
