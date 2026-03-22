import 'package:flutter/material.dart';
import 'package:tanakrit_interactivity_exercises/models/choice.dart';

class QuestionChoiceCard extends StatelessWidget {
  final Choice choice;
  final bool isSelected;
  final VoidCallback onTap;

  const QuestionChoiceCard({
    super.key,
    required this.choice,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isSelected ? colorScheme.primaryContainer : choice.displayColor,
        child: Center(child: Text(choice.name, textAlign: TextAlign.center)),
      ),
    );
  }
}
