import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemy_bloc/bloc/course.bloc.dart';
import 'package:flutterdemy_bloc/widgets/course.widget.dart';

class ListOfCourses extends StatelessWidget {
  const ListOfCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.courses.length,
          itemBuilder: (context, index) {
            return CourseWidget(course: state.courses[index]);
          },
        );
      },
    );
  }
}
