void main() {
  Car carObj = Car("BMW", 200);
  print("The car ${carObj.name} is running at ${carObj.speed} kmph !");
}

class Car {
  final String? name;
  final double? speed;

  Car(this.name, this.speed);
}
