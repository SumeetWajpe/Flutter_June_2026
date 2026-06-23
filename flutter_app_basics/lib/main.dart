import 'package:flutter/material.dart';
import 'package:flutter_app_basics/widgets/Container.dart';
import 'package:flutter_app_basics/widgets/RowsAndCols.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Basic Flutter App",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        // body: MyContainer(),
        body: RowsCols(),
      ),
    );
  }
}

//  body: Center(
//           child: Text(
//             "Hello Flutter !",
//             style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
//           ),
//         ),
