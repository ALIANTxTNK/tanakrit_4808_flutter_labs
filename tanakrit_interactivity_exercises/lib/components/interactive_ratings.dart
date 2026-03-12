import 'package:flutter/material.dart';

class InteractiveRatings extends StatefulWidget {

  final int totalStars;
  final double starSize;
  final double spacing;
  final Color activeColor;
  final Color inactiveColor;

  const InteractiveRatings({
    super.key,
    this.totalStars = 5,
    this.starSize = 30,
    this.spacing = 6,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  State<InteractiveRatings> createState() => _InteractiveRatingsState();
}

class _InteractiveRatingsState extends State<InteractiveRatings> {

  int rating = 0;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,

      children: List.generate(widget.totalStars, (index) {

        return GestureDetector(

          onTap: () {

            setState(() {
              rating = index + 1;
            });

          },

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.spacing),

            child: Icon(
              Icons.star,
              size: widget.starSize,

              color: index < rating
                  ? widget.activeColor
                  : widget.inactiveColor,
            ),
          ),
        );

      }),
    );
  }
}