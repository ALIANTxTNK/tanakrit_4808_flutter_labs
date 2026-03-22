import 'package:flutter/material.dart';
import 'package:tanakrit_interactivity_exercises/models/question.dart';
import '../components/question_choice_card.dart';

class QuizScreen extends StatefulWidget {
  final Question question;
  final int questionIndex;
  final int? initialSelectedIndex;
  final bool isInitiallyAnswered;
  final void Function(int) onAnswerSelected;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final bool isFirst;
  final bool isLast;

  const QuizScreen({
    super.key,
    required this.question,
    required this.questionIndex,
    required this.initialSelectedIndex,
    required this.isInitiallyAnswered,
    required this.onAnswerSelected,
    required this.onNext,
    required this.onPrevious,
    required this.isFirst,
    required this.isLast,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }

  @override
  void didUpdateWidget(covariant QuizScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSelectedIndex != widget.initialSelectedIndex ||
        oldWidget.isInitiallyAnswered != widget.isInitiallyAnswered) {
      setState(() {
        selectedIndex = widget.initialSelectedIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            widget.question.title,
            style: TextStyle(
              fontSize: widget.question.fontSize ?? 24,
              color:
                  widget.question.color ??
                  Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Image.asset(widget.question.imagePath),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
              itemCount: widget.question.choices.length,
              itemBuilder: (context, index) {
                return QuestionChoiceCard(
                  choice: widget.question.choices[index],
                  isSelected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    widget.onAnswerSelected(index);
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: widget.isFirst
                ? MainAxisAlignment.end
                : MainAxisAlignment.spaceBetween,
            children: [
              if (!widget.isFirst)
                ElevatedButton(
                  onPressed: widget.onPrevious,
                  child: const Text('Previous'),
                ),
              ElevatedButton(
                onPressed: widget.onNext,
                child: Text(widget.isLast ? 'Finish' : 'Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
