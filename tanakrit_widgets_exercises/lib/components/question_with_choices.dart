import 'package:flutter/material.dart';
import 'package:tanakrit_widgets_exercises/components/question_choice.dart';

class QuestionWithChoices extends StatelessWidget {
  const QuestionWithChoices({
    super.key,
    required this.title,
    required this.imagePath,
    required this.choices,
  });

  final String title;
  final String imagePath;
  final List<QuestionChoice> choices;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),          
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [choices[0], choices[1]],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [choices[2], choices[3]],
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}
