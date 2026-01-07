//A custom Pet screen
//
// use this code to show pet image an their name
//@author Tanakrit Waree
//@date 2025-1-7
import 'package:flutter/material.dart';
import 'package:tanakrit_widgets_exercises/components/pet_card.dart';

class PetsScreen extends StatelessWidget{
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("My Pet App"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: PetCard(imagePath: "https://ichef.bbci.co.uk/news/976/cpsprodpb/67CF/production/_108857562_mediaitem108857561.jpg", 
                petName: "Bird")),
                Expanded(child: PetCard(imagePath: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg", 
                petName: "Dog")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: PetCard(imagePath: "https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_960_720.jpg", 
                petName: "Cat")),
                Expanded(child: PetCard(imagePath: "https://cdn.pixabay.com/photo/2019/09/19/06/09/peter-rabbit-4488325_1280.jpg", 
                petName: "Rabbit")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}