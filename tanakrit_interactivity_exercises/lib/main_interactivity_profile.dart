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
// reuse code from profile card and add more interactivity like rating and responsive design
// 
// Author: Tanakrit Waree
// Date: 2026-03-12
import 'package:flutter/material.dart';
import 'screens/profile_card_rating_responsive.dart';
void main() {
  runApp(const MainInteractivityProfile());
}

class MainInteractivityProfile extends StatelessWidget {
  const MainInteractivityProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
      ),
     darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyanAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: const Scaffold(
        body: SafeArea(child: ProfileCardRatingResponsive()),
      ),
    );
  }
}
