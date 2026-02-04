import 'package:flutter/material.dart';

class RatingsWidget extends StatelessWidget {
  const RatingsWidget({
    super.key,
    required this.defaultColor,
    required this.ratingColor,
  });

  final Color defaultColor;
  final Color ratingColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.star, color: Colors.green),
        Icon(Icons.star, color: Colors.green),
        Icon(Icons.star, color: Colors.green),
        Icon(Icons.star, color: Colors.green),
        Icon(Icons.star, color: Colors.black),
      ],
    );
  }
}
