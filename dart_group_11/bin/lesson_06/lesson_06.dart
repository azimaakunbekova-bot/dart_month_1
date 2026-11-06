import 'animals.dart';

void main() {
  Animal.showCounter();

  Cat cat = Cat(2, 'Tom', Color.yellow);
  print(cat.getInfo());
  cat.meow();

  Dog dog = Dog(5, 'Rex', Color.red, 'Sit');
  print(dog.getInfo());

  FightingDog fightingDog = FightingDog(1, 'Max', Color.green, 'Fight', 13);
  print(fightingDog.getInfo());

  print(fightingDog.color);
  // Animal.counter = 100;
  Animal.showCounter();

  if (fightingDog.commands == 'Fight') {
    print('This dog is dangerous');
  }

  if (fightingDog.color == Color.green) {
    print('This dog is beautiful');
  }
}
