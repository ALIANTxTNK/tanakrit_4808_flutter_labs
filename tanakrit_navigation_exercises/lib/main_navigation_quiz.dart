// ============================================
// AI DOCUMENTATION
// Tool: ChatGPT
// Prompt: help me to do this lab and explain to me step by step, and help me to fix gitignore
// ============================================
//
// EXPLANATION (in my own words):
// use ai to help me to do lab and fix about git
//
// VERIFICATION:
// I can do code and i think git will work
//
// MODIFICATIONS:
// about gitignore, yaml, code
//
// Author: Tanakrit Waree
// Date: 2026-03-12
import 'package:flutter/material.dart';
import 'package:tanakrit_interactivity_exercises/models/question.dart';
import 'package:tanakrit_interactivity_exercises/models/choice.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App by 663040480-8',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        )
      
      ),
      themeMode: ThemeMode.system,
      home: const QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int currentQuestionIndex = 0;
  int score = 0;
  Map<int, int?> _selectedAnswers = {};
  Map<int, bool> _questionAnswered = {};
  int resetCounter = 0;

  final List<Question> questions = [
    Question(
      title: "Where is this picture?",
      imagePath: "assets/images/whitetemple.jpg",
      choices: [
        Choice(
          name: "Chiang Mai",
          isCorrect: true,
          displayColor: Colors.purple,
        ),
        Choice(
          name: "Khon Kaen",
          isCorrect: false,
          displayColor: Colors.orange,
        ),
        Choice(name: "Bangkok", isCorrect: false, displayColor: Colors.pink),
        Choice(name: "Phuket", isCorrect: false, displayColor: Colors.blue),
      ],
    ),
    Question(
      title: "Where is this picture?",
      imagePath: "assets/images/ann.jpg",
      choices: [
        Choice(name: "Ann", isCorrect: true, displayColor: Colors.purple),
        Choice(name: "Yaya", isCorrect: false, displayColor: Colors.orange),
        Choice(name: "Kimberry", isCorrect: false, displayColor: Colors.pink),
        Choice(name: "Bella", isCorrect: false, displayColor: Colors.blue),
      ],
    ),
    Question(
      title: "Where is this picture?",
      imagePath: "assets/images/kku.jpg",
      choices: [
        Choice(
          name: "Chiang Mai University",
          isCorrect: false,
          displayColor: Colors.purpleAccent,
        ),
        Choice(
          name: "Khon Kaen University",
          isCorrect: true,
          displayColor: Colors.orangeAccent,
        ),
        Choice(
          name: "Chulalongkorn University",
          isCorrect: false,
          displayColor: Colors.pinkAccent,
        ),
        Choice(
          name: "Mahidol University",
          isCorrect: false,
          displayColor: Colors.blueAccent,
        ),
      ],
    ),
  ];

  void _onAnswerSelected(int questionIndex, int choiceIndex) {
    setState(() {
      if (_selectedAnswers[questionIndex] != null) {
        int prevChoice = _selectedAnswers[questionIndex]!;
        if (questions[questionIndex].choices[prevChoice].isCorrect) {
          score--;
        }
      }
      _selectedAnswers[questionIndex] = choiceIndex;
      if (questions[questionIndex].choices[choiceIndex].isCorrect) {
        score++;
      }
      _questionAnswered[questionIndex] = true;
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _showScoreDialog();
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed'),
        content: Text('Your score: $score / ${questions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _restartQuiz();
            },
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }

  void _restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      _selectedAnswers.clear();
      _questionAnswered.clear();
      resetCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz App')),
      body: QuizScreen(
        key: ValueKey(resetCounter),
        question: questions[currentQuestionIndex],
        questionIndex: currentQuestionIndex,
        initialSelectedIndex: _selectedAnswers[currentQuestionIndex],
        isInitiallyAnswered: _questionAnswered[currentQuestionIndex] ?? false,
        onAnswerSelected: (choiceIndex) =>
            _onAnswerSelected(currentQuestionIndex, choiceIndex),
        onNext: _nextQuestion,
        onPrevious: _previousQuestion,
        isFirst: currentQuestionIndex == 0,
        isLast: currentQuestionIndex == questions.length - 1,
      ),
    );
  }
}
