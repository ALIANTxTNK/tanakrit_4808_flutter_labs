// ============================================
// AI DOCUMENTATION
// Tool: ChatGPT 
// Prompt: How to reuse previous code how to start can you help me?
// ============================================
//
// EXPLANATION (in my own words):
// I don't know how to reuse previous code so i need chat to guide me for the start and the i'm do follow document,
// and then i have problem with the import line so i ask chat to help.
//
// VERIFICATION:
// I Can start somthing and its work 
//
// MODIFICATIONS:
// ContactImageWidget(imagePath: 'assets/images/ann.jpg', name: 'Ann')
// ContactInfoWidget(addressName: "Ann's Place",addressInfo: "123 Main St",phone: "(081) 986-2164",email: "ann@email.com"),
// RatingsWidget(defaultColor: Colors.black, ratingColor: Colors.green)
// Author: Tanakrit Waree
// Date: 2025-02-11
import 'package:flutter/material.dart';
import 'package:tanakrit_widgets_exercises/components/contact_image.dart';
import 'package:tanakrit_widgets_exercises/components/contact_info.dart';
import 'package:tanakrit_widgets_exercises/components/ratings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainProfileCardRatingResponsive(),
    );
  }
}

class MainProfileCardRatingResponsive extends StatelessWidget {
  const MainProfileCardRatingResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.cyanAccent,
          child: orientation == Orientation.portrait
              ? _buildPortraitLayout()
              : _buildLandscapeLayout(),
        ),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ContactImageWidget(imagePath: 'assets/images/ann.jpg', name: 'Ann'),
        ContactInfoWidget(
          addressName: "Ann's Place",
          addressInfo: "123 Main St",
          phone: "(081) 986-2164",
          email: "ann@email.com",
        ),
        RatingsWidget(defaultColor: Colors.black, ratingColor: Colors.green),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      children: const [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContactImageWidget(
                imagePath: 'assets/images/ann.jpg',
                name: 'Ann',
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContactInfoWidget(
                addressName: "Ann's Place",
                addressInfo: "123 Main St",
                phone: "(081) 986-2164",
                email: "ann@email.com",
              ),
              SizedBox(height: 20),
              RatingsWidget(
                defaultColor: Colors.black,
                ratingColor: Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
