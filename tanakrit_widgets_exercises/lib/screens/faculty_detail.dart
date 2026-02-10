import 'package:flutter/material.dart';
import 'package:tanakrit_widgets_exercises/models/faculty_model.dart';

class FacultyDetail extends StatelessWidget {
  const FacultyDetail({super.key, required this.facultyModel});

  final FacultyModel facultyModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(facultyModel.name), centerTitle: true),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8
            ),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Text(
              facultyModel.description,
              style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onPrimary),
              
            ),
          ),
          const SizedBox(height: 20),
          Text(
            facultyModel.thainame,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(flex: 2, 
          child: 
          Image.network(facultyModel.imageURL)),
        ],
      ),
    );
  }
}
