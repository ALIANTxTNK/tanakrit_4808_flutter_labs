import 'package:flutter/material.dart';
import '../models/choice.dart';

class QuestionChoiceCard extends StatelessWidget {

  final Choice choice;
  final bool isSelected;
  final bool selectionMade;
  final VoidCallback? onSelected;

  const QuestionChoiceCard({
    super.key,
    required this.choice,
    required this.isSelected,
    required this.selectionMade,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {

    Color bgColor = choice.displayColor;

    if (selectionMade && isSelected) {
      bgColor = choice.isCorrect ? Colors.green : Colors.red;
    }

    return GestureDetector(
      onTap: selectionMade ? null : onSelected,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          choice.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}