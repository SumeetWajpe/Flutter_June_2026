import 'package:flutter/material.dart';
import 'package:flutterdemy_basics/widgets/listview_builder_stateful_course.dart';

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
   
      body: CourseList(),
    );
  }
}
