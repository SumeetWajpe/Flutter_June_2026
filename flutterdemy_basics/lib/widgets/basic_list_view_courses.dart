import 'package:flutter/material.dart';

class CourseListUsingListView extends StatelessWidget {
  CourseListUsingListView({super.key});
  final List<String> listofcourses = ["React", "Angular", "Node", "Flutter"];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ...listofcourses.map(
          (String course) => Text(course, style: TextStyle(fontSize: 30)),
        ),
      ],
    );
  }
}


// [...listofcourses.map((String course) => Text(course))],

// OR

// [Text("React"),Text("Angular")........]