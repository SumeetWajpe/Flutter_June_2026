import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image(image: AssetImage("assets/images/react.jpg"), width: 100),
      ],
    );
  }
}
