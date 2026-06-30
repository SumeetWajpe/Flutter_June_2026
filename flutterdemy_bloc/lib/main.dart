import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemy_bloc/bloc/course.bloc.dart';
import 'package:flutterdemy_bloc/widgets/listofcourses.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => CourseBloc(), child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: ListOfCourses())),
    );
  }
}
