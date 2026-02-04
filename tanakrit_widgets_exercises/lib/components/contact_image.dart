import 'package:flutter/material.dart';

class ContactImageWidget extends StatelessWidget {
  const ContactImageWidget({
    super.key,
    required this.imagePath,
    required this.name,
  });

  final String imagePath;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0.6, 0.6),
      children: [
        CircleAvatar(radius: 150, backgroundImage: AssetImage(imagePath)),
        Container(
          decoration: BoxDecoration(color: Colors.black),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
