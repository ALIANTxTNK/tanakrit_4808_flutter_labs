//A custom widget Font
//
// this widthget used to show the screen
// Add fontfamily, myname, fontsize, fontweight
//@author Tanakrit Waree
//@date 2025-1-13

import 'package:flutter/material.dart';
import 'components/custom_font.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: CustomFont(
          name: "Tanakrit Waree",
          fontFamily: "Nunito",
          fontSize: 30,
          fontWeight: FontWeight.bold),
      ),
  ));
}