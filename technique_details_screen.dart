import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TechniqueDetailsScreen extends StatelessWidget {
  final String technique;

  const TechniqueDetailsScreen({Key? key, required this.technique})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final techniqueDetails = _getTechniqueDetails(technique);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Technique Details'),
      ),
      body: Center(
        child: SingleChildScrollView(
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
              Text(
                technique,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ...techniqueDetails['details'],
              const SizedBox(height: 20),
              Text(
                'Additional Facts: ${techniqueDetails['additionalInfo']}',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.grey,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () async {
                  final url = techniqueDetails['youtubeLink'];
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: const Text(
                  'Video Tutorial Link',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> _getTechniqueDetails(String technique) {
    switch (technique) {
      case 'Journaling':
        return {
          'details': [
            const Text(
                '1. Set a Routine: Dedicate a specific time each day for journaling, such as first thing in the morning or before bed. Consistency helps make journaling a habit.'),
            const Text(
                '2. Be Honest: Write openly and honestly without worrying about grammar or spelling. Journaling is for your eyes only, so it\'s important to express your true thoughts and feelings.'),
            const Text(
                '3. Reflect on Entries: Periodically review your past entries to identify patterns, progress, and recurring themes in your thoughts and behaviors.'),
          ],
          'additionalInfo':
              'Journaling helps clarify thoughts and emotions, promoting emotional well-being.',
          'youtubeLink': 'https://www.youtube.com/watch?v=7CcZ7gyFXv0',
        };
      case 'Positive Affirmations':
        return {
          'details': [
            const Text(
                '1. Create Personalized Affirmations: Tailor affirmations to address your specific needs and goals. For example, if you\'re dealing with anxiety, an affirmation might be, "I am calm and at peace."'),
            const Text(
                '2. Use Present Tense: Phrase affirmations in the present tense, as if they are already true. This helps reinforce the desired mindset. For example, say "I am confident" instead of "I will be confident."'),
            const Text(
                '3. Repeat Daily: Repeat your affirmations multiple times a day, ideally in the morning and before bed. Consistent repetition helps reinforce positive beliefs.'),
          ],
          'additionalInfo':
              'Positive affirmations can rewire the brain to replace negative thoughts with positive ones.',
          'youtubeLink': 'https://www.youtube.com/watch?v=y_GWW2xDgVA',
        };
      case 'Adequate Sleep':
        return {
          'details': [
            const Text(
                '1. Establish a Sleep Routine: Go to bed and wake up at the same time every day, even on weekends. This helps regulate your body\'s internal clock.'),
            const Text(
                '2. Create a Sleep-Friendly Environment: Keep your bedroom dark, cool, and quiet. Use blackout curtains, earplugs, or a white noise machine if necessary.'),
            const Text(
                '3. Relaxing Bedtime Routine: Develop a calming pre-sleep routine, such as reading a book, taking a warm bath, or practicing relaxation techniques like deep breathing or meditation.'),
          ],
          'additionalInfo':
              'Adequate sleep improves cognitive function, mood, and overall health.',
          'youtubeLink': 'https://www.youtube.com/watch?v=IzQ2siryQrM',
        };
      case 'Time Management':
        return {
          'details': [
            const Text(
                '1. Prioritize Tasks: Identify and focus on your most important tasks first. Use methods like the Eisenhower Matrix to categorize tasks by urgency and importance.'),
            const Text(
                '2. Use a Planner: Utilize a planner or digital calendar to organize your daily schedule, set deadlines, and keep track of appointments and commitments.'),
            const Text(
                '3. Break Tasks into Smaller Steps: Divide larger projects into smaller, more manageable tasks. This makes them less overwhelming and easier to tackle.'),
          ],
          'additionalInfo':
              'Effective time management reduces stress and increases productivity.',
          'youtubeLink': 'https://www.youtube.com/watch?v=-f30i_WlP6g',
        };
      case 'Massage Therapy':
        return {
          'details': [
            const Text(
                '1. Choose the Right Type: Different types of massage (Swedish, deep tissue, aromatherapy) serve different purposes. Research and choose the one that best suits your needs.'),
            const Text(
                '2. Communicate with Your Therapist: Clearly communicate your preferences, pain points, and any health concerns with your massage therapist to ensure a personalized and effective session.'),
            const Text(
                '3. Stay Hydrated: Drink plenty of water before and after your massage. Hydration helps flush out toxins released during the massage and reduces muscle soreness.'),
          ],
          'additionalInfo':
              'Massage therapy relieves muscle tension and promotes relaxation.',
          'youtubeLink': 'https://www.youtube.com/watch?v=CkapVK9hsb0',
        };
      default:
        return {
          'details': [const Text('No details available.')],
          'additionalInfo': 'No additional information available.',
          'youtubeLink': '',
        };
    }
  }
}
