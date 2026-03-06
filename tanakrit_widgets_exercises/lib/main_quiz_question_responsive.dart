// ============================================
// AI DOCUMENTATION
// Tool: ChatGPT 
// Prompt: Next, we'll teach you step by step, with explanations, just like asking a friend for help.
// ============================================
//
// EXPLANATION (in my own words):
// Use AI for help me with somethimg that i don't understand like asking my friend how to do this.
//
// VERIFICATION:
// I Understand more about grid view and more in responsive
//
// MODIFICATIONS:
// fix error in return QuestionChoice from question_choice_responsive.dart
// fix error in grid view when you rotate the picture does not fit in the screen
// Author: Tanakrit Waree
// Date: 2025-03-06
import 'package:flutter/material.dart';
import 'components/question_choices_responsive.dart';

void main() {
  runApp(const QuizResponsiveApp());
}

class QuizResponsiveApp extends StatelessWidget {
  const QuizResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: QuestionWithChoicesResponsive(
          question: "Where is this picture?",
          imagePath: "assets/images/kku.jpg",
        ),
      ),
    );
  }
}