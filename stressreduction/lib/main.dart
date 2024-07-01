import 'package:flutter/material.dart';
import 'mindfulness_exercises.dart';
import 'affirmations_page.dart';
import 'stress_reduction_techniques_screen.dart';


void main() {
  runApp(MindfulnessApp());
}

class MindfulnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mindfulness App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
        ).copyWith(
          secondary: const Color(0xFFB2DFDB), // Light teal
          surface: const Color(0xFFF5F5F5), // Light grey
        ),
        textTheme: TextTheme(
          bodyLarge: const TextStyle(color: Colors.black87),
          bodyMedium: const TextStyle(color: Colors.black54),
          headlineMedium: TextStyle(color: Colors.blueGrey.shade800, fontWeight: FontWeight.bold),
        ),
      ),
      home: const HomePage(), // Make HomePage constructor const
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key); // Make constructor const

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mindfulness App'), // Use const for static widgets
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/medi2.png', errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error); // Show error icon if image fails to load
            }), // Replace with your icon path
            onPressed: () {
              // Define the action when the icon is pressed
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Medi2 icon pressed!')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Introductory text section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome to the Mindfulness & Stress Reduction App!',
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'This app is designed to help you practice mindfulness, reduce stress, and boost your mental well-being with daily affirmations.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30), // Reduce excessive spacing
                    ],
                  ),
                ),
                // Triangle formation icon buttons
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildCircularIconLabelButton(
                          context,
                          'assets/icons/mind.png', // Replace with your icon path
                          'Mindfulness Exercises',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MindfulnessExercisesPage()),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 15), // Spacing between rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildCircularIconLabelButton(
                          context,
                          'assets/icons/meditation.png', // Replace with your icon path
                          'Stress Reduction Techniques',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => StressReductionTechniquesScreen()),
                            );
                          },
                        ),
                        const SizedBox(width: 20), // Spacing between icons
                        buildCircularIconLabelButton(
                          context,
                          'assets/icons/affirmations.png', // Replace with your icon path
                          'Daily Affirmations ',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AffirmationsPage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCircularIconLabelButton(BuildContext context, String iconPath, String label, VoidCallback onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(50), // Circular border radius
          child: Ink(
            height: 80, // Height for the circular button
            width: 80, // Width for the circular button
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Circular shape
              color: Theme.of(context).colorScheme.secondary, // Button background color
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0), // Inner padding for the icon
              child: Image.asset(
                iconPath,
                fit: BoxFit.contain,
                color: Colors.white, // Tint icon with white
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, color: Colors.red); // Show error icon if image fails to load
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 8), // Spacing between the icon and the text
        Container(
          width: 120, // Adjusted width for the text container
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
            maxLines: 2, // Limit to 2 lines of text
            overflow: TextOverflow.ellipsis, // Wrap text with ellipsis if too long
          ),
        ),
      ],
    );
  }
}
