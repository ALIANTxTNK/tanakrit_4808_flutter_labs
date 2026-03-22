// ===========================================
// AI DOCUMENTATION
// Tool: Claude
// Prompt: help me to do this lab
// ===========================================
//
// EXPLANATION (in my own words):
// use named routes '/' for cover page and '/quiz' for quiz app
// cover page shows icon, welcome text, and start button
// home button on every question uses popUntil to go back to cover page
//
// VERIFICATION:
// I can do this lab by following the instructions step by step
//
// MODIFICATION:
// about git navigation and routing
//
// Author: Tanakrit Waree
// Date: 2026-03-22
// ===========================================

import 'package:flutter/material.dart';
import 'package:tanakrit_interactivity_exercises/models/question.dart';
import 'package:tanakrit_interactivity_exercises/models/choice.dart';
import 'screens/quiz_screen_home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
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
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const QuizCoverPage(),
        '/quiz': (context) => const QuizApp(),
      },
    ),
  );
}

// ─────────────────────────────────────────
// Cover Page
// ─────────────────────────────────────────
class QuizCoverPage extends StatelessWidget {
  const QuizCoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Icon(Icons.quiz_outlined, size: 120, color: colorScheme.primary),
              const SizedBox(height: 24),
              Text(
                'Welcome to the Quiz App TW',
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(color: colorScheme.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'By Tanakrit Waree 663040480-8',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/quiz');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('Start' ,style: TextStyle(fontSize: 22),),
              ),
            ],
          ),
        ),
      ),
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
      title: 'Where is this picture?',
      imagePath: 'assets/images/whitetemple.jpg',
      choices: [
        Choice(
          name: 'Chiang Mai',
          isCorrect: true,
          displayColor: Colors.purple,
        ),
        Choice(
          name: 'Khon Kaen',
          isCorrect: false,
          displayColor: Colors.orange,
        ),
        Choice(name: 'Bangkok', isCorrect: false, displayColor: Colors.pink),
        Choice(name: 'Phuket', isCorrect: false, displayColor: Colors.blue),
      ],
    ),
    Question(
      title: 'Where is this picture?',
      imagePath: 'assets/images/ann.jpg',
      choices: [
        Choice(name: 'Ann', isCorrect: true, displayColor: Colors.purple),
        Choice(name: 'Yaya', isCorrect: false, displayColor: Colors.orange),
        Choice(name: 'Kimberry', isCorrect: false, displayColor: Colors.pink),
        Choice(name: 'Bella', isCorrect: false, displayColor: Colors.blue),
      ],
    ),
    Question(
      title: 'Where is this picture?',
      imagePath: 'assets/images/kku.jpg',
      choices: [
        Choice(
          name: 'Chiang Mai University',
          isCorrect: false,
          displayColor: Colors.purpleAccent,
        ),
        Choice(
          name: 'Khon Kaen University',
          isCorrect: true,
          displayColor: Colors.orangeAccent,
        ),
        Choice(
          name: 'Chulalongkorn University',
          isCorrect: false,
          displayColor: Colors.pinkAccent,
        ),
        Choice(
          name: 'Mahidol University',
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
      setState(() => currentQuestionIndex++);
    } else {
      _showScoreDialog();
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() => currentQuestionIndex--);
    }
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
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
    final isFirst = currentQuestionIndex == 0;
    final isLast = currentQuestionIndex == questions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App by 663040480-8'),
        automaticallyImplyLeading: false,
      ),
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
        isFirst: isFirst,
        isLast: isLast,
        showPreviousButton: !isFirst,
        showNextButton: true,
      ),
    );
  }
}
