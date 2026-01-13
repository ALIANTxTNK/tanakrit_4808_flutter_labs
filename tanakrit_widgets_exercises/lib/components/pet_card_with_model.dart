//A custom widget Font
//
// this widthget used to make frame of image and text
// Add fontfamily, myname, fontsize, fontweight
//@author Tanakrit Waree
//@date 2025-1-13

import 'package:flutter/material.dart';
import 'package:tanakrit_widgets_exercises/models/pet_model.dart';

class PetCardWithModel extends StatelessWidget {

  final PetModel pet;

  const PetCardWithModel({
    super.key,
    required this.pet
  });

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
      ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.network(
          pet.imageUrl,
          width: 120,
          height: 120,
          fit: BoxFit.cover,)
      ),

      Container(
        width: 120,
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: pet.backgroundColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12)
          )
        ),
        child: Text(
          pet.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: pet.textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold
            
          ),
        ),
      )

     ],
    );
  }
}