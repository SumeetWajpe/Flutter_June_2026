import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String errorMsg;
  const ErrorPage({super.key, required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: Text("Error - Something went wrong !")),
          Text(errorMsg, style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
