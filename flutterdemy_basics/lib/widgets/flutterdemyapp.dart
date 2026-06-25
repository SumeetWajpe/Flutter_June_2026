import 'package:flutter/material.dart';
import 'package:flutterdemy_basics/widgets/listview_builder_stateful_course.dart';
import 'package:flutterdemy_basics/widgets/total_courses.dart';

class FlutterdemyApp extends StatelessWidget {
  const FlutterdemyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutterdemy",
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(child: CourseList()),
          TotalCourseCount(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // navigate to NewCourse widget
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
