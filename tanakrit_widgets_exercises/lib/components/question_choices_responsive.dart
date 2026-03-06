import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import 'question_choice.dart';

class QuestionWithChoicesResponsive extends StatelessWidget {
  final String question;
  final String imagePath;

  const QuestionWithChoicesResponsive({
    super.key,
    required this.question,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {

    bool portrait = Responsive.isPortrait(context);

    return Padding(
      padding: Responsive.getScreenPadding(context),

      child: Column(
        children: [

          Text(
            question,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // ⭐ จำกัดขนาดรูป
          SizedBox(
            height: portrait ? 180 : 120,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),

          // ⭐ GridView ต้องอยู่ใน Expanded
          Expanded(
            child: GridView.builder(
              padding: portrait
                  ? const EdgeInsets.all(20)
                  : const EdgeInsets.all(40),

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: portrait ? 2.5 : 8,
              ),

              itemCount: 4,

              itemBuilder: (context, index) {

                final choices = [
                  {"text": "Chiang Mai University", "color": Colors.purpleAccent},
                  {"text": "Khon Kaen University", "color": Colors.orangeAccent},
                  {"text": "Chulalongkorn University", "color": Colors.pinkAccent},
                  {"text": "Mahidol University", "color": Colors.blueAccent},
                ];

                return QuestionChoice(
                  name: choices[index]["text"] as String,
                  bgColor: choices[index]["color"] as Color,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}