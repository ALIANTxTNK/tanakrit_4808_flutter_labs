// ============================================
// AI DOCUMENTATION
// No AI tools were used for this file.
// All code written independently.
//
// I create a quiz question app that displays a question with an image and multiple choices. in question_choice.dart
// I create a question with choices component that arranges the question title, image, and choices in a structured layout. in question_with_choices.dart
// and in main file, I set up the main application to use these components to present a quiz question to the user and also have proper theming for light and dark modes.
// @author Tanakrit Waree
// @date 2026-2-3
// ============================================
import 'package:flutter/material.dart';
import 'package:tanakrit_widgets_exercises/components/question_choice.dart';
import 'package:tanakrit_widgets_exercises/components/question_with_choices.dart';

void main() {
  runApp(const MainQuizQuestion());
}

class MainQuizQuestion extends StatelessWidget {
  const MainQuizQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final List<QuestionChoice> choices = [
      const QuestionChoice(name: "Chiang Mai University", bgColor: Colors.purpleAccent),
      const QuestionChoice(name: "Khon Kaen University", bgColor: Colors.orangeAccent),
      const QuestionChoice(name: "Chulalongkorn University", bgColor: Colors.pinkAccent),
      const QuestionChoice(name: "Mahidol University", bgColor: Colors.blueAccent),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(title: const Text("Quizz App by 663040480-8")),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: QuestionWithChoices(title: 'Where is this picture?', imagePath: 'assets/images/kku.jpg', choices: choices),
        ),
      ),
    );
  }
}
