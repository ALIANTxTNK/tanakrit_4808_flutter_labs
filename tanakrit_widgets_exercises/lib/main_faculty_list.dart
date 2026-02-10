// ============================================
// AI DOCUMENTATION
// No AI tools were used for this file.
// All code written independently.
//
// I create faculty list that show list of faculty and when you click you will see the page yhat have url, name, thai name and image,
// by create model first and then do main file that have thememode and have class that have name, thainame, url, image of faculty,
// then do app bar with my student id and Navigator to use when user click to lead into next page that have details of faculty.
// Author by Tanakrit Waree 
// @date 2026-2-10
// ============================================
import 'package:flutter/material.dart';
import 'package:tanakrit_widgets_exercises/models/faculty_model.dart';
import 'package:tanakrit_widgets_exercises/screens/faculty_detail.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,

      home: MainFacultyList(),
    ),
  );
}

class MainFacultyList extends StatefulWidget {
  const MainFacultyList({super.key});

  @override
  State<MainFacultyList> createState() => _MainFacultyListState();
}

class _MainFacultyListState extends State<MainFacultyList> {
  static List<String> facname = ['Engineering', 'Medicine', 'Architecture'];
  static List<String> facThaiName = [
    'วิศวกรรมศสตร์',
    'แพทยศสตร์',
    'สถปัตยกรรมศสตร์',
  ];
  static List url = [
    'https://www.en.kku.ac.th/web/',
    'https://md.kku.ac.th/',
    'https://arch.kku.ac.th/web/',
  ];
  static List<String> facImages = [
    'https://www.u-review.in.th/uploads/schools/20160815142844BWNpahw.png',
    'https://admissions.kku.ac.th/wp-content/uploads/2021/08/03.jpg',
    'https://www.u-review.in.th/timthumb.php?src=/uploads/contents/20160811142552uE0fuxK.jpg&w=923&h=520',
  ];

  final List<FacultyModel> facultyData = List.generate(
    facname.length,
    (index) => FacultyModel(
      name: facname[index],
      thainame: facThaiName[index],
      description: url[index],
      imageURL: facImages[index],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("KKU Faculties by 663040480-8")),
      body: ListView.builder(
        itemCount: facultyData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(facultyData[index].name),
              leading: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FacultyDetail(facultyModel: facultyData[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
