import 'package:flutter/material.dart';

class RowsCols extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          height: 100,
          width: 100,
          color: Colors.amber,
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 100,
          width: 100,
          color: const Color.fromARGB(255, 119, 255, 7),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 100,
          width: 100,
          color: const Color.fromARGB(255, 31, 69, 140),
        ),
      ],
    );
  }
}
