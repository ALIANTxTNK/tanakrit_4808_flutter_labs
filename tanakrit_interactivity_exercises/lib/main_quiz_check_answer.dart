// ============================================
// AI DOCUMENTATION
// Tool: ChatGPT 
// Prompt: Help me to start and teach me abot this lab like asking friend, asking for help to make choice better
// ============================================
//
// EXPLANATION (in my own words):
// I want to stat doing lab step by step to learn how to do
//
// VERIFICATION:
// I can start and code, and at the end i modifidaction code by my self, i can have choice that i need
//
// MODIFICATIONS:
// child: Center(
//   child: Container(
//     width: 150,
//     height: 90,
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//       color: currentColor,
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Text(
//       widget.name,
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         color: widget.fgColor,
//         fontSize: 16,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   ),
// ),
// 
// Author: Tanakrit Waree
// Date: 2026-03-12
import 'package:flutter/material.dart';
import 'screens/question_with_choices.dart';
import 'components/question_choice.dart';

void main() {
  runApp(const MainQuizCheckAnswer());
}

class MainQuizCheckAnswer extends StatelessWidget {
  const MainQuizCheckAnswer({super.key});

  @override
  Widget build(BuildContext context) {

    final List<QuestionChoice> choices = [
      const QuestionChoice(
        name: "Chiang Mai University",
        bgColor: Colors.purpleAccent,
        fgColor: Colors.white,
        correct: false,
      ),
      const QuestionChoice(
        name: "Khon Kaen University",
        bgColor: Colors.orangeAccent,
        fgColor: Colors.white,
        correct: true,
      ),
      const QuestionChoice(
        name: "Chulalongkorn University",
        bgColor: Colors.pinkAccent,
        fgColor: Colors.white,
        correct: false,
      ),
      const QuestionChoice(
        name: "Mahidol University",
        bgColor: Colors.blueAccent,
        fgColor: Colors.white,
        correct: false,
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App by 663040480-8"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: QuestionWithChoices(
            title: "Where is this picture?",
            imagePath: "assets/images/kku.jpg",
            choices: choices,
          ),
        ),
      ),
    );
  }
}