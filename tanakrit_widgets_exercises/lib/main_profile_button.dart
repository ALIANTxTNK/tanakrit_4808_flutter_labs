// ============================================
// AI DOCUMENTATION
// Tool: ChatGPT 
// Prompt: Help me to start and teach me abot this lab like asking friend
// ============================================
//
// EXPLANATION (in my own words):
// I want to stat doing lab step by step to learn how to do
//
// VERIFICATION:
// I can start and code, and at the end i modifidaction code by my self
//
// MODIFICATIONS:
// About Layout And more 
// Image.asset(
//   'assets/images/Peakdiwa.jpg',
//    width: double.infinity,
//    height: 400,
//    fit: BoxFit.cover,
// Author: Tanakrit Waree
// Date: 2026-03-12

import 'package:flutter/material.dart';
import 'package:tanakrit_widgets_exercises/components/profile_with_button.dart';

void main() {
  runApp(const MainProfileButton());
}

class MainProfileButton extends StatelessWidget {
  const MainProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: const Scaffold(body: SafeArea(child: ProfileWithButton())),
    );
  }
}
