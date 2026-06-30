void main() {
  print("App started..");

  Future.delayed(Duration(seconds: 5), () {
    print('Hello from future !');
  });

  print('App Ended..');
}
