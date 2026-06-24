import 'package:flutter/material.dart';

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 100;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(count.toString(), style: const TextStyle(fontSize: 30)),
        ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text("++"),
        ),
      ],
    );
  }
}
