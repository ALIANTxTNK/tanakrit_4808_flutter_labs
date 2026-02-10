import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  /// The rating value from 0.0 to 5.0
  final double rating;

  /// Size of each star icon (default: 16)
  final double size;

  /// Color of filled and half stars (default: Colors.amber)
  final Color color;

  /// Color of empty stars (default: Colors.grey)
  final Color emptyColor;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 16,
    this.color = Colors.amber,
    this.emptyColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the number of each type of star
    // Example: rating = 3.5
    //   fullStars = 3 (floor of 3.5)
    //   hasHalfStar = true (3.5 - 3 = 0.5 >= 0.5)
    //   emptyStars = 5 - 3 - 1 = 1
    //   Result: ★★★⯨☆

    int fullStars = rating.floor(); // Integer part
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min, // Take only needed space
      children: [
        for (int i = 0; i < fullStars; i++)
          Icon(Icons.star, color: color, size: size),

        if (hasHalfStar) Icon(Icons.star_half, color: color, size: size),

        for (int i = 0; i < emptyStars; i++)
          Icon(Icons.star_border, color: emptyColor, size: size),
      ],
    );
  }
}
