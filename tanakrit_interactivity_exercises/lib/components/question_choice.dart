import 'package:flutter/material.dart';

class QuestionChoice extends StatefulWidget {
  final String name;
  final Color bgColor;
  final Color fgColor;
  final bool correct;

  const QuestionChoice({
    super.key,
    required this.name,
    required this.bgColor,
    required this.fgColor,
    required this.correct,
  });

  @override
  State<QuestionChoice> createState() => _QuestionChoiceState();
}

class _QuestionChoiceState extends State<QuestionChoice> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    Color currentColor = widget.bgColor;

    if (tapped) {
      currentColor = widget.correct ? Colors.green : Colors.red;
    }

    return GestureDetector(
      onTap: () {
        if (tapped) return;

        setState(() {
          tapped = true;
        });

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(widget.correct ? "Correct!" : "Incorrect"),
              content: Text(
                widget.correct ? "Your score is 1" : "Your score is 0",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      },

      child: Center(
        child: Container(
          width: 200,
          height: 90,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: currentColor),
          child: Text(
            widget.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: widget.fgColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
