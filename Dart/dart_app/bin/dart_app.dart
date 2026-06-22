import 'package:dart_app/dart_app.dart' as dart_app;

void main(List<String> arguments) {
  var x = 100; // Type inferencing
  // x = "Hello"; // error
  print(x);

  // int y = 200;

  // const
  const PI = 3.14;
  // const PI;
  // PI = 3.14; // Error (const requires initializer)
  // PI = 3.14545; // Error

  // final someVal = 200;
  // someVal = 100;   // Error

  final d;

  // 100 lines of code
  d = DateTime.now();

  // difference - final is a runtime constant & const is compile time constant
  
}
