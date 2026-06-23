void main() {
  Car carObj = Car("BMW", 250);
  print(carObj.accelerate());

  JamesBondCar jbc = JamesBondCar(
    name: "Aston Martin",
    speed: 400,
    isArmed: true,
  );
  print(jbc.accelerate());
}

class Car {
  final String? name;
  final double? speed;

  Car(this.name, this.speed);
  String accelerate() {
    return "The car $name is running at $speed kmph !";
  }
}

class JamesBondCar extends Car {
  bool? isArmed;
  JamesBondCar({String name = "AUDI", double speed = 300, this.isArmed = false})
    : super(name, speed);

  @override
  String accelerate() {
    // TODO: implement accelerate
    return "${super.accelerate()} , is it armed ? $isArmed";
  }
}

abstract class Connection {
  void open();
  void close();
}

class OracleConnection extends Connection {
  @override
  void open() {
    // TODO: implement open
  }
  @override
  void close() {
    // TODO: implement close
  }
}
