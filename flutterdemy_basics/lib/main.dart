import 'package:flutter/material.dart';
import 'package:flutterdemy_basics/widgets/basic_list_view_courses.dart';
import 'package:flutterdemy_basics/widgets/listview_builder_courses.dart';
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
        // body: CourseListUsingListView()
        // body: CoursesWithListTile(),
        body: ListViewBuilderBasic_CourseList(),
      ),
    );
  }
}
