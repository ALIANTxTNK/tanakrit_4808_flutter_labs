import 'package:flutter/material.dart';

// import widget จาก package เก่า
import 'package:tanakrit_widgets_exercises/components/contact_image.dart';
import 'package:tanakrit_widgets_exercises/components/contact_info.dart';

// import star widget ใหม่
import '../components/interactive_ratings.dart';

class ProfileCardRatingResponsive extends StatelessWidget {
  const ProfileCardRatingResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final colorScheme = Theme.of(context).colorScheme;

    if (orientation == Orientation.portrait) {
      /// PORTRAIT MODE
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ContactImageWidget(
              imagePath: 'assets/images/ann.jpg',
              name: 'Ann',
            ),

            const SizedBox(height: 20),

            const ContactInfoWidget(
              addressInfo: '123 Main St',
              addressName: 'Ann Doe',
              email: 'ann.doe@example.com',
              phone: '(555) 123-4567',
            ),

            const SizedBox(height: 20),

            InteractiveRatings(
              activeColor: colorScheme.primary,
              inactiveColor: colorScheme.outlineVariant,
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: const ContactImageWidget(
                imagePath: 'assets/images/ann.jpg',
                name: 'Ann',
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ContactInfoWidget(
                    addressInfo: '123 Main St',
                    addressName: 'Ann Doe',
                    email: 'ann.doe@example.com',
                    phone: '(555) 123-4567',
                  ),

                  const SizedBox(height: 20),

                  InteractiveRatings(
                    activeColor: colorScheme.primary,
                    inactiveColor: colorScheme.outlineVariant,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
