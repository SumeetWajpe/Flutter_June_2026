import 'package:flutter/material.dart';
import 'package:flutterdemy_basics/models/courselist_changenotifier_mode.dart';
import 'package:flutterdemy_basics/screens/add_new_course.dart';
import 'package:flutterdemy_basics/widgets/basic_list_view_courses.dart';
import 'package:flutterdemy_basics/widgets/counter.dart';
import 'package:flutterdemy_basics/widgets/flutterdemyapp.dart';
import 'package:flutterdemy_basics/widgets/listview_builder_courses.dart';
import 'package:flutterdemy_basics/widgets/listview_builder_stateful_course.dart';
import 'package:flutterdemy_basics/widgets/listview_listtile.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CourseListNotifier(),
      child: MaterialApp(home: const AddNewCourse()),
    ),
  );
}
