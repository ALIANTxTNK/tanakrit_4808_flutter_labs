// ============================================
// AI DOCUMENTATION
// Tool: ChatGPT 
// Prompt: Help me to start and teach me abot this lab like asking friend, help me to fix bug
// ============================================
//
// EXPLANATION (in my own words):
// I need ai to help and teach me to do lab step by step to learn how to do, and also help me to fix bug that i have in my code
//
// VERIFICATION:
// I can start and code, and at the end i modifidaction code by my self, i can have choice that i need
//
// MODIFICATIONS:
// And also i made 2 question in quiz, and also i add score to show in dialog at the end of quiz
// ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 40,
//                   vertical: 15,
//                 ),
//               ),
//               onPressed: widget.onNext,
//               child: const Text("Next"),
//             ),
// // 
// Author: Tanakrit Waree
// Date: 2026-03-12
import 'package:flutter/material.dart';
import 'models/question.dart';
import 'models/choice.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    ),
  );
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int currentQuestionIndex = 0;
  int score = 0;
  bool questionAnswered = false;
  int resetCounter = 0;

  final List<Question> questions = [
    Question(
      title: "Where is this picture?",
      imagePath: "assets/images/whitetemple.jpg",
      choices: const [
        Choice(name: "Chiang Mai", isCorrect: true, displayColor: Colors.purple),
        Choice(name: "Khon Kaen", isCorrect: false, displayColor: Colors.orange),
        Choice(name: "Bangkok", isCorrect: false, displayColor: Colors.pink),
        Choice(name: "Phuket", isCorrect: false, displayColor: Colors.blue),
      ],
    ),
    Question(
      title: "Where is this picture?",
      imagePath: "assets/images/Wat_Arun.jpg",
      choices: const [
        Choice(name: "Bangkok", isCorrect: true, displayColor: Colors.purple),
        Choice(name: "Chiang Rai", isCorrect: false, displayColor: Colors.orange),
        Choice(name: "Phuket", isCorrect: false, displayColor: Colors.pink),
        Choice(name: "Krabi", isCorrect: false, displayColor: Colors.blue),
      ],
    ),
  ];

  void _handleAnswer(bool isCorrect) {
    setState(() {
      if (isCorrect) score++;
      questionAnswered = true;
    });
  }

  void _handleNext() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        questionAnswered = false;
      });
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text("Quiz Complete!"),
          content: Text("Your score: $score / ${questions.length}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                  questionAnswered = false;
                  resetCounter++;
                });
              },
              child: const Text("Restart Quiz"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: QuizScreen(
        key: ValueKey('${currentQuestionIndex}_$resetCounter'),
        question: questions[currentQuestionIndex],
        onAnswer: _handleAnswer,
        showNextButton: questionAnswered,
        onNext: _handleNext,
      ),
    );
  }
}