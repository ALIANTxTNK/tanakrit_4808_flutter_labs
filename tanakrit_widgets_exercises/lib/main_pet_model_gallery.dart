//A custom widget Font
//
//this widthget i debug banner 
//@author Tanakrit Waree
//@date 2025-1-13
import 'package:flutter/material.dart';
import "package:tanakrit_widgets_exercises/screens/pets_gallery_screen.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PetsGalleryScreen(),
    );
  }
}
