import 'animals.dart';
import 'transports.dart';
import 'interfaces.dart';
import 'mixins.dart';

void main() {
  // Start of program

  Dog dog = Dog(2, 'black');
  // dog.draw();
  // dog.jump();

  Plane plane = Plane();

  List<Drawable> drawables = [
    plane,
    dog,
    Parrot(1, 'Polly'),
    Car(),
    Snake(10, 'Kaa'),
  ];

  for (Drawable d in drawables) {
    drawAllVariants(d);
    if (d is Animal) {
      Animal a = d as Animal; // type casting
      a.makeVoice();
    }
    if (d is Flyable) {
      (d as Flyable).fly();
      (d as Flyable).flyHigh();
    }
    if (d is Jump) {
      (d as Jump).jump();
    }
  }
}

void drawAllVariants(Drawable d) {
  d.draw();
  print(d.draw3D('plastic'));
}
