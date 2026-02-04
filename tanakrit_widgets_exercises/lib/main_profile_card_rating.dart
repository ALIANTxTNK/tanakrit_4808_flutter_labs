// ============================================
// AI DOCUMENTATION
// No AI tools were used for this file.
// All code written independently.
//
// I create a profile card app that displays a contact image, contact information, and a rating component. in contact_image.dart
// and create a contact information component that shows address, phone number, and email. in contact_info.dart
// and create a ratings component that allows users to rate with stars. in ratings.dart
// In the main file, I set up the main application to use these components to present a profile card with proper theming for light and dark modes.
// @author Tanakrit Waree
// @date 2026-2-4
// ============================================

import 'package:flutter/material.dart';
import 'package:tanakrit_widgets_exercises/components/contact_image.dart';
import 'package:tanakrit_widgets_exercises/components/contact_info.dart';
import 'package:tanakrit_widgets_exercises/components/ratings.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Card',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,

      home: Scaffold(
        appBar: AppBar(title: const Text('Profile Card with Rating')),
        body: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.amberAccent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ContactImageWidget(
                imagePath: 'assets/images/ann.jpg',
                name: 'Ann',
              ),
              ContactInfoWidget(
                addressName: "Ann's Place",
                addressInfo: "123 Main St",
                phone: "(081) 986-2164",
                email: "ann@email.com",
              ),
              RatingsWidget(
                defaultColor: Colors.black,
                ratingColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
