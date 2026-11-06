import 'interfaces.dart';

abstract class Transport implements Drawable {}

class Car extends Transport {
  @override
  void draw() {
    print('🚗');
  }

  @override
  String draw3D(String material) {
    return 'Car is drawn in 3D with $material';
  }
}

class Plane extends Transport implements Flyable {
  @override
  void draw() {
    print('🛩️');
  }

  @override
  String draw3D(String material) {
    return 'Plane is drawn in 3D with $material';
  }

  @override
  void fly() {
    print('I can fly');
  }

  @override
  void flyHigh() {
    print('I am flying high to Bishkek');
  }
}
