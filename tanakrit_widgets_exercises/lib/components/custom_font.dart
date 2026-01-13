//A custom widget Font
//
// this widthget used create box with bule color and margin and pading
//@author Tanakrit Waree
//@date 2025-1-13

import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  const CustomFont({
    super.key,
    required this.name,
    this.fontFamily,
    this.fontSize = 24,
    this.fontWeight = FontWeight.normal
  });

    final String name;
    final String? fontFamily;
    final double fontSize;
    final FontWeight fontWeight; 



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 1, 58, 138),
        borderRadius: BorderRadius.circular(16)
        
      ),
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.all(22),
        
      child:Text(
          name,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: Colors.white
          )
        ),
      )
    );
  }
}