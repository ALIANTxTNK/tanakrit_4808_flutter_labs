import 'package:flutter/material.dart';

class ProfileWithButton extends StatelessWidget {
  const ProfileWithButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Tanakrit",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "663040480-8",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        Image.asset(
          'assets/images/Peakdiwa.jpg',
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
          
        ),

        const SizedBox(height: 12),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Photo Credit: Patcharanan Waree",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        const Spacer(),

        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primaryContainer,
              foregroundColor: colorScheme.onPrimaryContainer,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Confirmation"),
                    content: const Text("Submitting Information"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text("Submit", style: TextStyle(fontSize: 30),),
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}
