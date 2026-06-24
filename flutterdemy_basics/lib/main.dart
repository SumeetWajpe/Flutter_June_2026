import 'package:flutter/material.dart';
import 'package:flutterdemy_basics/widgets/basic_list_view_courses.dart';
import 'package:flutterdemy_basics/widgets/counter.dart';
import 'package:flutterdemy_basics/widgets/listview_builder_courses.dart';
import 'package:flutterdemy_basics/widgets/listview_builder_stateful_course.dart';
import 'package:flutterdemy_basics/widgets/listview_listtile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Flutterdemy",
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        // body: CourseListUsingListView()
        // body: CoursesWithListTile(),
        // body: ListViewBuilderBasic_CourseList(),
        // body: Counter(),
        body: CourseList(),
      ),
    );
  }
}
