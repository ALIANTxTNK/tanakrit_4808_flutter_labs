//A custom widget Pet Gallery
//
// this widthget used to show the screen
//@author Tanakrit Waree
//@date 2025-1-7
import 'package:flutter/material.dart';
import 'screens/pets_screen.dart';
void main() {
  runApp(const QuoteCard());
}

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 0, 6, 177)),
      ),
      home: const PetsScreen(),
    );
  }
}