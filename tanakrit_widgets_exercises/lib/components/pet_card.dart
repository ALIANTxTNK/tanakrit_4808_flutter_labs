//A custom widget pet card
//
// this widthget used to decorate name box into pink color, made border radius into 10, image size is 120x120 px
//@author Tanakrit Waree
//@date 2025-1-7
import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  
  final String imagePath;
  final String petName;

  const PetCard({
    super.key,
    required this.imagePath,
    required this.petName,
  });

  @override
  Widget build(BuildContext context) {
     return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10)),
            child: Image.network(
              imagePath,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            ),
        Container(
          width:120,
          padding:const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10)),
            
            
          ),
          child: Text(
            petName, 
            textAlign:TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
           
            
            
          ),
          )  
        )
      ],
    );
  }
}