// ============================================
// AI DOCUMENTATION
// Tool: ChatGPT 
// Prompt: Next, teach me step by step, with explanations, just like asking a friend for help.
// ============================================
//
// EXPLANATION (in my own words):
// Use AI for help me with somethimg that i don't understand like asking my friend how to do this.
// and fix errror yto finish code
//
// VERIFICATION:
// I under stand how to do exercise step by step 
// and i understand why my code have error and how to fix it
//
// MODIFICATIONS:
// To improve the responsiveness of the application, the layout was modified to support different screen sizes such as mobile, tablet, and desktop.
// Author: Tanakrit Waree
// Date: 2025-03-06

import 'package:flutter/material.dart';
import 'screens/news_feed_screen.dart';

void main() {
  runApp(const NewsFeedApp());
}

class NewsFeedApp extends StatelessWidget {
  const NewsFeedApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),

      home: const Scaffold(
        body: SafeArea(
          child: NewsFeedScreen(),
        ),
      ),
    );
  }
}