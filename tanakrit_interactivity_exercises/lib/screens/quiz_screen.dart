import 'package:flutter/material.dart';
import '../models/question.dart';
import '../components/question_choice_card.dart';

class QuizScreen extends StatefulWidget {
  final Question question;
  final ValueChanged<bool>? onAnswer;
  final bool showNextButton;
  final VoidCallback? onNext;

  const QuizScreen({
    super.key,
    required this.question,
    this.onAnswer,
    required this.showNextButton,
    this.onNext,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedIndex;
  bool selectionMade = false;

  void _handleChoiceSelected(int index) {
    if (selectionMade) return;

    final isCorrect = widget.question.choices[index].isCorrect;

    setState(() {
      selectedIndex = index;
      selectionMade = true;
    });

    widget.onAnswer?.call(isCorrect);
  }

  @override
  Widget build(BuildContext context) {
    final portrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Column(
      children: [
        const SizedBox(height: 20),

        Text(
          widget.question.title,
          style: TextStyle(
            fontSize: widget.question.fontSize ?? 22,
            color: widget.question.color ?? Colors.indigoAccent,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        Image.asset(widget.question.imagePath, height: 150),

        const SizedBox(height: 20),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              itemCount: widget.question.choices.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: portrait ? 2.5 : 6,
              ),
              itemBuilder: (context, index) {
                return QuestionChoiceCard(
                  choice: widget.question.choices[index],
                  isSelected: selectedIndex == index,
                  selectionMade: selectionMade,
                  onSelected: () => _handleChoiceSelected(index),
                );
              },
            ),
          ),
        ),

        if (selectionMade && widget.showNextButton)
          Padding(
            padding: const EdgeInsets.all(40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              onPressed: widget.onNext,
              child: const Text("Next"),
            ),
          ),
      ],
    );
  }
}
