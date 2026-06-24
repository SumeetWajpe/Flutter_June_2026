import 'package:flutter/material.dart';

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
