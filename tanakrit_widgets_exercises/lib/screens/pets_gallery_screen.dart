//A custom widget Font
//
// this widthget link pet image and name and text color and background color
//@author Tanakrit Waree
//@date 2025-1-13
import 'package:flutter/material.dart';
import 'package:tanakrit_widgets_exercises/components/pet_card_with_model.dart';
import 'package:tanakrit_widgets_exercises/models/pet_model.dart';

class PetsGalleryScreen extends StatelessWidget {
  const PetsGalleryScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Pet App"),
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PetCardWithModel(
                pet: PetModel(name: "Bird", imageUrl: "https://ichef.bbci.co.uk/news/976/cpsprodpb/67CF/production/_108857562_mediaitem108857561.jpg"),)
              ),

              Expanded(
                child: PetCardWithModel(
                pet: PetModel(name: "Dog",backgroundColor: Colors.redAccent, imageUrl: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg"),)
              )
            ],
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PetCardWithModel(
                pet: PetModel(name: "Cat",textColor: Colors.yellowAccent, imageUrl: "https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_960_720.jpg"),)
              ),

              Expanded(
                child: PetCardWithModel(
                pet: PetModel(name: "Rabbit",backgroundColor: Colors.greenAccent, imageUrl: "https://cdn.pixabay.com/photo/2019/09/19/06/09/peter-rabbit-4488325_1280.jpg"),)
              )
            ],
          )
        ],
      ),
    );
  }
}