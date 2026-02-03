import 'package:flutter/material.dart';

class QuestionChoice extends StatelessWidget {
  const QuestionChoice({
    super.key,
    required this.name,
    required this.bgColor,
    this.fgColor,
  });

  final String name;
  final Color bgColor;
  final Color? fgColor;

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        fgColor ??
        (ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark
            ? Colors.white
            : Colors.black);
    return Container(
      width: 150,
      height: 60,
      color: bgColor,
      padding: const EdgeInsets.all(10),
      child: Text(name, style: TextStyle(color: textColor)),
    );
  }
}
