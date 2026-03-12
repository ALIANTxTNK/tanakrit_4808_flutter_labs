import 'package:flutter/material.dart';
import '../components/question_choice.dart';

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
    final portrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),

        Expanded(
          flex: 3,
          child: GridView.builder(
            itemCount: choices.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: portrait ? 2.5 : 6,
            ),
            itemBuilder: (context, index) {
              return choices[index];
            },
          ),
        ),
      ],
    );
  }
}
