import 'interfaces.dart';
import 'mixins.dart';

// Можно наследовать.
// Может содержать готовые методы.
// Может иметь абстрактные методы, которые наследник обязан реализовать.

abstract class Animal implements Drawable {
  int age;
  String color;

  Animal(this.age, this.color);

  void sleep() {
    print('Animal is sleeping');
  }

  void makeVoice();
}

class Dog extends Animal with Jump, Run {
  Dog(super.age, super.color);

  @override
  void makeVoice() {
    print('Woof!');
  }

  @override
  void draw() {
    print('🐶');
  }

  @override
  String draw3D(String material) {
    return 'Dog is drawn in 3D with $material';
  }
}

abstract class Reptile extends Animal {
  Reptile(super.age, super.color);
}

class Snake extends Reptile {
  Snake(super.age, super.color);

  @override
  void makeVoice() {
    print('Ssssss');
  }

  @override
  void draw() {
    print('🐍');
  }

  @override
  String draw3D(String material) {
    return 'Snake is drawn in 3D with $material';
  }
}

class Parrot extends Animal with Run, Jump implements Flyable {
  Parrot(super.age, super.color);

  @override
  void makeVoice() {
    print('Chik chirik');
  }

  @override
  void draw() {
    print('🦜');
  }

  @override
  String draw3D(String material) {
    return 'Parrot is drawn in 3D with $material';
  }

  @override
  void fly() {
    print('Parrot is flying');
  }

  @override
  void flyHigh() {
    print('Parrot is flying high in the sky');
  }
}
