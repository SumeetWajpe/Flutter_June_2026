import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      height: 100,
      width: 100,
      color: Colors.amber,
      child: const Text("Using Container !"),
    );
  }
}
