import 'choice.dart';

import 'package:flutter/material.dart';

class Question {
  final String title;
  final String imagePath;
  final List<Choice> choices;
  final Color? color; // optional text color for the question
  final double? fontSize; // optional font size for the title

  const Question({
    required this.title,
    required this.imagePath,
    required this.choices,
    this.color,
    this.fontSize,
  });
}
