import 'package:flutter/material.dart';
import 'package:flutterdemy_basics/models/courselist_changenotifier_mode.dart';
import 'package:provider/provider.dart';

class TotalCourseCount extends StatelessWidget {
  const TotalCourseCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseListNotifier>(
      builder: (_, courseListChangeNotifierObj, __) => Container(
        margin: EdgeInsets.all(20),
        child: Text(
          "Total Courses : ${courseListChangeNotifierObj.listofcourses.length}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}
